import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:country_picker/country_picker.dart';
import 'dart:async';
import 'dart:io';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  //final networkHandler = NetworkHandler();
  bool circular = false;
  late PickedFile _imageFile;
  final _globalkey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _profession = TextEditingController();
  TextEditingController _dob = TextEditingController();
  TextEditingController _title = TextEditingController();
  TextEditingController _about = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File ? image;
  String? _value;
  String? _value_sex;
  String country="Location";
  @override
  Widget build(BuildContext context) {
    final topAppBar = AppBar(
      leading: Image.asset(
        'images/edit.png',
        scale: 3,
      ),
      title: Text(
        'Edit Profile',
        style: TextStyle(
            fontFamily: 'Roboto-mono', fontSize: 25, color: Colors.black),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
    );
    final saveButton=Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(icon: Icon(Icons.save),onPressed: (){},),
      ],
    );

    return Scaffold(
      appBar: topAppBar,
      body: Form(
        key: _globalkey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          children: <Widget>[
            saveButton,
            imageProfile(),
            SizedBox(
              height: 20,
            ),
            nameTextField(),
            SizedBox(
              height: 20,
            ),
            gender(),
            SizedBox(
              height: 20,
            ),
            sexuality(),
            SizedBox(
              height: 20,
            ),
            location(),
            //show(),
            SizedBox(
              height: 20,
            ),
            aboutTextField(),
            SizedBox(
              height: 20,
            ),
            InkWell(),
          ],
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 80.0,
          backgroundImage:(image==null)? AssetImage('images/man.png'):FileImage(image!) as ImageProvider,
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: Icon(
              Icons.camera_alt,
              color: Colors.black,
              size: 28.0,
            ),
          ),
        ),
      ]),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(
      source: source,
    );
    setState(() {
      this.image = File(pickedFile!.path);
    });
  }

  Widget nameTextField() {
    return TextFormField(
      controller: _name,
      validator: (value) {
        if (value == null){ return "Name can't be empty";}

        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orange,
              width: 2,
            )),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.black,
        ),
        labelText: "Name",
        helperText: "Name can't be empty",
        hintText: "Dev Stack",
      ),
    );
  }

  Widget gender() {
    List<String> list_items=['Male','Female','Binary'];
    return  Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child:DropdownButtonHideUnderline(
        child: DropdownButton(
          value: _value,
          items: list_items.map((String item) {
            return DropdownMenuItem<String>(
              child: Text('$item'),
              value: item,
            );
          }).toList(),
          onChanged:(value) {
            setState(() {
              _value = value as String;
            });
          },
          hint:Text("Gender"),
          disabledHint:Text("Disabled"),
          elevation: 8,
          style:TextStyle(color:Colors.black, fontSize: 16),
          icon: Icon(Icons.arrow_drop_down_circle),
          iconDisabledColor: Colors.red,
          iconEnabledColor: Colors.black,
          isExpanded: true,
        ),
      ),
    );
  }


  Widget sexuality() {
    List<String> list_items=['Straight','Gay','Lesbian','Bisexual'];
    return  Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child:DropdownButtonHideUnderline(
        child: DropdownButton(
          value: _value_sex,
          items: list_items.map((String item) {
            return DropdownMenuItem<String>(
              child: Text('$item'),
              value: item,
            );
          }).toList(),
          onChanged:(value) {
            setState(() {
              _value_sex = value as String;
            });
          },
          hint:Text("Sexuality"),
          disabledHint:Text("Disabled"),
          elevation: 8,
          style:TextStyle(color:Colors.black, fontSize: 16),
          icon: Icon(Icons.arrow_drop_down_circle),
          iconDisabledColor: Colors.red,
          iconEnabledColor: Colors.black,
          isExpanded: true,
        ),
      ),
    );
  }
  Widget location() {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.,
      children: [
        ElevatedButton(onPressed: (){showLocation();}, child: Text('Location')),
        Container(
          width: 200,
          height:40,
          margin:EdgeInsets.only(left: 15),
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
          child: Text(country),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
      ],
    );
  }



  void showLocation(){
    showCountryPicker(
                context: context,
                countryListTheme: CountryListThemeData(
                  flagSize: 25,
                  backgroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 16, color: Colors.blueGrey),
                  //Optional. Sets the border radius for the bottomsheet.
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  //Optional. Styles the search field.
                  inputDecoration: InputDecoration(
                    labelText: 'Search',
                    hintText: 'Start typing to search',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color(0xFF8C98A8).withOpacity(0.2),
                      ),
                    ),
                  ),
                ),
                onSelect: (Country country) => setState(() {
                  this.country=country.name;
                }),
              );
  }

  Widget aboutTextField() {
    return TextFormField(
      controller: _about,
      validator: (value) {
        if (value == null)
          return "Bio can't be empty";

        return null;
      },
      maxLines: 4,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orange,
              width: 2,
            )),
        labelText: "Bio",
        helperText: "Write about yourself",
        hintText: "I am Jane Smith",
      ),
    );
  }
}
