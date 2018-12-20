
use_frameworks!
inhibit_all_warnings!


def thrift_pods

    pod 'Thrift', :git => 'https://github.com/apocolipse/Thrift-Swift'

end


def main_pods
    
    pod 'Bond'
    pod 'ReactiveKit'
    pod 'RealmSwift'
    pod 'ReachabilitySwift'

end


target 'RealmTestApp'  do
    main_pods
    thrift_pods
 
end

post_install do |installer|

    swift32Targets = [ 'Thrift']
    
    installer.pods_project.targets.each do |target|
        if swift32Targets.include? target.name
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '3.2'
            end
        end
    end
end

