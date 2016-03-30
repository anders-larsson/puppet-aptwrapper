require 'spec_helper'

describe 'aptwrapper' do
  let :facts do
    {
      :lsbdistid        => 'Debian',
      :osfamily         => 'Debian',
      :lsbdistcodename  => 'wheezy',
      :puppetversion    => Puppet.version,
    }
  end

  hiera_parameters_matrix = {
    'sources' => {
      :nomerge_entries  => %w(archive.ubuntu.com-trusty-backports),
      :merge_entries    => %w(archive.ubuntu.com-trusty
                              archive.ubuntu.com-trusty-security
                              archive.ubuntu.com-trusty-updates
                              archive.ubuntu.com-trusty-backports
      ),
    },
    'keys' => {
      :nomerge_entries  => %w(4BD6EC30),
      :merge_entries    => %w(4BD6EC30
                              55BE302B
      ),
    },
    'ppas' => {
      :nomerge_entries  => %w(ppa:nginx/stable),
      :merge_entries    => %w(ppa:nginx/stable
                              ppa:drizzle-developers/ppa
      ),
    },
    'pins' => {
      :nomerge_entries  => %w(testing),
      :merge_entries    => %w(testing
                              stable
      ),
    },
    'settings' => {
      :nomerge_entries  => %w(pref-banana),
      :merge_entries    => %w(pref-banana
                              conf-banana
      ),
    },
  }

  describe 'configured from hiera' do
    context 'with defaults for all parameters' do
      it { should contain_class('aptwrapper') }
    end

    [true, false].each do |value|
      context "with data specified in hiera and hiera_merge parameters set to #{value}" do
        if value == true
          fqdn    = 'hieramerge.example.com'
          entries = :merge_entries
        else
          fqdn    = 'nohieramerge.example.com'
          entries = :nomerge_entries
        end
        let :facts do
          {
            :osfamily         => 'Debian',
            :lsbdistcodename  => 'trusty',
            :lsbdistid        => 'ubuntu',
            :lsbdistrelease   => '14.04',
            :fqdn             => fqdn.to_s,
            :specific         => 'hiera',
          }
        end

        it { should contain_class('aptwrapper') }
        it { should contain_class('apt') }

        hiera_parameters_matrix['sources'][entries].each do |hiera_entry|
          it do
            should contain_apt__source(hiera_entry)
          end
        end

        hiera_parameters_matrix['keys'][entries].each do |hiera_entry|
          it do
            should contain_apt__key(hiera_entry)
          end
        end

        hiera_parameters_matrix['ppas'][entries].each do |hiera_entry|
          it do
            should contain_apt__ppa(hiera_entry)
          end
        end

        hiera_parameters_matrix['pins'][entries].each do |hiera_entry|
          it do
            should contain_apt__pin(hiera_entry)
          end
        end

        hiera_parameters_matrix['settings'][entries].each do |hiera_entry|
          it do
            should contain_apt__setting(hiera_entry)
          end
        end
      end
    end
  end
end
