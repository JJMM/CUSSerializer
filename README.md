Automatic serialization tool,convert model to NSDictionary, support recursive conversion NSDictionary, NSArray data structures.<br>
![image](https://github.com/JJMM/CUSResources/raw/master/CUSSerializer.jpg)

## How To Get Started
1.Copy the folder named CUSSerializer to your project

## serialize
Only one line of code recursive convert model to NSDictionary.
```objective-c
CUSSchool *school = [[CUSSchool alloc]init];
NSDictionary *serializeDic = [school serialize];
```
## deserialize
Only one line of code recursive convert NSDictionary to model.
```objective-c
NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:path];
CUSSchool *school = [dictionary deserialize];
```
## Mapping
The class name is mapped to another symbol for many types of client
```objective-c
[CUSSerializer setClassMapping:@"CUSSchool" mappingFor:@"School"];
[CUSSerializer setClassMapping:@"CUSTeacher" mappingFor:@"Teacher"];
[CUSSerializer setClassMapping:@"CUSStudent" mappingFor:@"Student"];
```
## LOG
open or close Log
```objective-c
[CUSSerializer setLogStatus:NO];
```
## License
CUSSerializer is licensed under the terms of the [Apache License, version 2.0](http://www.apache.org/licenses/LICENSE-2.0.html). Please see the [LICENSE](LICENSE) file for full details.

## Contributions

Contributions are totally welcome. We'll review all pull requests and if you send us a good one/are interested we're happy to give you push access to the repo. Or, you know, you could just come work with us.<br>

Please pay attention to add Star, your support is my greatest motivation, thank you.