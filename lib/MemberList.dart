import 'Member.dart';

class MemberList{
  List<Member> list = List<Member>();
  MemberList.fromJson(var json){
    for(int i = 0; i < json.length; i++)
      list.add(Member.fromJson(json[i]));
  }

  MemberList.fromMemberList(MemberList memberList){
    for(int i = 0; i < memberList.list.length; i++)
      list.add(memberList.list[i]);
  }
}