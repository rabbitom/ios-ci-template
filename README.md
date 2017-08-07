# iOS travis-ci template

This template is for integrating iOS projects with travis-ci. The goal is to build and deploy ipa file to fir.im automatically after code push.

## Usage:
1. Assume you have linked your github account, and enabled the project on travis-ci.
1. Copy .travis.yml and scripts/ to the root folder of your iOS project.
1. Make sure you have a .xcworkspace or .xcodeproj file at root folder, that would be the build target. If both, the .xcworkspace will be picked.
1. Create a folder called "profiles" at root folder, copy Ad-Hoc mobileprovision file(downloaded from Apple developer website) and a ios-dist.p12 file with distribution cert and private key(exported from KeyChain access app of your Mac) into it.
1. Set APP_NAME in .travis.yml, that would be the scheme to build. And make sure you use "Product->Scheme->Manage Schemes..." in Xcode to make schemes shared, and add them to source control.
1. Set filename(without extension) of your Ad-Hoc mobileprovision file as PROFILE_NAME in .travis.yml.
1. Encrypt your profiles to scripts folder with `./encrypt-profiles.sh`, make sure openssl decryption commands are added into your .travis.yml file, at before_install section, following `mkdir profiles` command. Or use `./encrypt-profiles-openssl.sh`. Add *.enc files created at scripts folder to source control.
1. Make sure you ignore profile/ at your .gitignore file, you can use .gitignore file from this template.
1. Set the password of your p12 file as environment variable P12_PASSWORD in project settings of travis-ci.
1. Set your fir api token as environment variable FIR_TOKEN in project settings of travis-ci.
1. Now you are good to go, commit all your changes and push the code, compiling should begin on travis-ci. Good luck!