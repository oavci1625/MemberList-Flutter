# Member List

This is a flutter application made by Onuralp AVCI.

Application has 3 different classes called "Hipo.dart", "Member.dart", and "MemberList.dart."

Hipo.dart:
  This is a simple class which has two properties:
    'position' is a string which has job position of the member
    'yearsInHipo' is an integer which has work experience of the member

Member.dart:
  This is a relatively more complicated class. It has basic properties like name, age, location, etc.
  It has a specific constructor which is Member.fromJson(Map<String, dynamic> json);
  This constructor gets a json map and creates a member from this.
  
  toJson(): method is for returning the json map of the member but it is not used in this version.
  
MemberList.dart:
  This class again has a simple interface. It contains a list of members inside. It has to different constructors:
  
   MemberList.fromJson(var json) This constructor creates member list from json
   MemberList.fromMemberList(MemberList memberList) This is the copy constructor
   
   
At initialization of the program, makeRequest() method is called which gets the json file from assets of the project and intiliaze MemberList object. Member list is created from the array called filteredMemberList. At first it is same with memberList list, but as users are searching for names, this list is modified which also affects the UI accordingly.

Lastly, 'ADD NEW USER' button creates a new instance of member who is me (Onuralp AVCI). It is added to the memberList and at the same time filteredMemberList is also updated. User can add as many new users as they want. Scroll view let's use to see every user in one single page.


Sample video of the app:
https://drive.google.com/file/d/1G20TrrBEBjFbphkeONY2DTyvOOKClc2C/view?usp=sharing
