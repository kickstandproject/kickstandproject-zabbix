require 'spec_helper'

describe 'zabbix::client', :type => :class do
  context 'on Ubuntu 12.04 (Precise)' do
    let(:facts) { { 
      :lsbdistcodename  => 'precise',
      :lsbdistrelease   => '12.04',
      :operatingsystem  => 'Ubuntu',
    } }

    let(:params) { { :monitor => false } }

    it do
      should_not contain_class('zabbix::client::monitor')
    end

    it do
      should contain_file('/etc/zabbix').with({
        'ensure'  => 'directory',
        'group'   => 'root',
        'mode'    => '0640',
        'owner'   => 'root',
      })
    end

    it do
      should contain_file('/etc/zabbix/zabbix_agentd.conf.d').with({
        'ensure'  => 'directory',
        'group'   => 'root',
        'mode'    => '0640',
        'owner'   => 'root',
        'require' => 'File[/etc/zabbix]',
      })
    end

    it do
      should contain_file('/etc/zabbix/zabbix_agentd.conf').with({
        'ensure'  => 'file',
        'group'   => 'root',
        'mode'    => '0640',
        'owner'   => 'root',
      })
    end

    it do
      should contain_package('zabbix-agent').with_ensure('present')
    end

    it do
      should contain_service('zabbix-agent').with({
        'ensure'      => true,
        'enable'      => true,
        'hasstatus'   => true,
        'hasrestart'  => true,
      })
    end

    context 'service disabled' do
      let(:params) { {
        :enable   => false,
        :monitor  => false,
      } }
      it do
        should contain_service('zabbix-agent').with({
          'ensure'      => false,
          'enable'      => false,
          'hasstatus'   => true,
          'hasrestart'  => true,
        })
      end
    end
  end
end

# vim:sw=2:ts=2:expandtab:textwidth=79
