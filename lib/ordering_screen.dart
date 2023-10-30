import 'package:flutter/material.dart';
import 'package:flutter_ordering/ui/components/app_button.dart';
import 'package:flutter_ordering/ui/components/app_colors.dart';
import 'package:flutter_ordering/ui/components/app_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderingScreen extends StatefulWidget {
  const OrderingScreen({Key? key}) : super(key: key);

  @override
  State<OrderingScreen> createState() => _OrderingScreenState();
}

class _OrderingScreenState extends State<OrderingScreen> {
  bool isAddAddressSelectedSender = true;
  bool isAddAddressSelectedRecipient = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: buildContent(),
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  PreferredSizeWidget buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.primaryBackground,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        color: AppColors.primaryText,
        onPressed: () {},
      ),
      centerTitle: true,
      title: Text(
        "Ordering",
        style: GoogleFonts.roboto(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryText,
        ),
      ),
    );
  }

  Widget buildBottomNavigationBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppButton(
        height: 45,
        onPressed: () {},
        text: 'Next step',
        textColor: AppColors.white,
        backgroundColor: AppColors.accentColor,
      ),
    );
  }

  Widget buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        buildStepText(),
        const SizedBox(height: 10),
        buildStartDateField(),
        const SizedBox(height: 30),
        buildSenderDetailsText(),
        buildSenderButtons(),
        const SizedBox(height: 10),
        isAddAddressSelectedSender
            ? Column(
                children: [
                  buildFullNameField('Danilev Egor'),
                  const SizedBox(height: 10),
                  buildEmailField('egor_zu@email.com'),
                  const SizedBox(height: 10),
                  buildPhoneNumberField('+375726014690'),
                  const SizedBox(height: 10),
                  buildCountryField('Belarus'),
                  const SizedBox(height: 10),
                  buildCityField('Minsk'),
                  const SizedBox(height: 10),
                  buildAddressLine1Field('Derzhinskogo 3b'),
                  const SizedBox(height: 10),
                  buildAddressLinePlus(),
                  const SizedBox(height: 10),
                  buildPostcodeField('220069'),
                ],
              )
            : Column(
                children: [
                  buildSearchTextField(),
                  const SizedBox(height: 10),
                  buildCard(
                      'Denilev Egor', 'Belarus, Minsk, Derzhinskogo 3b, 80100'),
                ],
              ),
        const SizedBox(height: 50),
        buildRecipientDetailsText(),
        buildRecipientButtons(),
        const SizedBox(height: 10),
        isAddAddressSelectedRecipient
            ? Column(
                children: [
                  buildFullNameField('Ko Yuri'),
                  const SizedBox(height: 10),
                  buildEmailField('yuri@email.com'),
                  const SizedBox(height: 10),
                  buildPhoneNumberField('+375294545687'),
                  const SizedBox(height: 10),
                  buildCountryField('Italy'),
                  const SizedBox(height: 10),
                  buildCityField('Naple'),
                  const SizedBox(height: 10),
                  buildAddressLine1Field('Via Toledo 256'),
                  const SizedBox(height: 10),
                  buildAddressLinePlus(),
                  const SizedBox(height: 10),
                  buildPostcodeField('80100'),
                  const SizedBox(height: 25),
                ],
              )
            : Column(
                children: [
                  buildSearchTextField(),
                  const SizedBox(height: 10),
                  buildCard('Ko Yuri', 'Italy, Naple, Via Toledo 256, 220069'),
                ],
              ),
      ],
    );
  }

  Widget buildSenderButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: AppButton(
            onPressed: () {
              setState(() {
                isAddAddressSelectedSender = true;
              });
            },
            text: 'Add address',
            textColor: isAddAddressSelectedSender
                ? AppColors.white
                : AppColors.secondaryText,
            backgroundColor: isAddAddressSelectedSender
                ? AppColors.accentColor
                : AppColors.lightGray,
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: AppButton(
            onPressed: () {
              setState(() {
                isAddAddressSelectedSender = false;
              });
            },
            text: 'Select address',
            textColor: isAddAddressSelectedSender
                ? AppColors.secondaryText
                : AppColors.white,
            backgroundColor: isAddAddressSelectedSender
                ? AppColors.lightGray
                : AppColors.accentColor,
          ),
        ),
      ],
    );
  }

  Widget buildRecipientButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: AppButton(
            onPressed: () {
              setState(() {
                isAddAddressSelectedRecipient = true;
              });
            },
            text: 'Add address',
            textColor: isAddAddressSelectedRecipient
                ? AppColors.white
                : AppColors.secondaryText,
            backgroundColor: isAddAddressSelectedRecipient
                ? AppColors.accentColor
                : AppColors.lightGray,
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: AppButton(
            onPressed: () {
              setState(() {
                isAddAddressSelectedRecipient = false;
              });
            },
            text: 'Select address',
            textColor: isAddAddressSelectedRecipient
                ? AppColors.secondaryText
                : AppColors.white,
            backgroundColor: isAddAddressSelectedRecipient
                ? AppColors.lightGray
                : AppColors.accentColor,
          ),
        ),
      ],
    );
  }
}

Widget buildStepText() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Step 1',
        style: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    ],
  );
}

Widget buildStartDateField() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Start date',
        style: GoogleFonts.roboto(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(height: 5),
      const AppTextField(
        labelText: 'Sep 12, 2023',
        icon: Icons.calendar_month,
      ),
    ],
  );
}

Widget buildSenderDetailsText() {
  return Text(
    'Sender details',
    style: GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
  );
}

Widget buildFullNameField(String labelText) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Full name*',
        style: GoogleFonts.roboto(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(height: 5),
      AppTextField(
        labelText: labelText,
        icon: Icons.person_sharp,
      ),
    ],
  );
}

Widget buildEmailField(String labelText) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Email*',
        style: GoogleFonts.roboto(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(height: 5),
      AppTextField(
        labelText: labelText,
        icon: Icons.email,
      ),
    ],
  );
}

Widget buildPhoneNumberField(String labelText) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Phone number*',
        style: GoogleFonts.roboto(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(height: 5),
      AppTextField(
        labelText: labelText,
        icon: Icons.call,
      ),
    ],
  );
}

Widget buildCountryField(String labelText) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Country*',
        style: GoogleFonts.roboto(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(height: 5),
      AppTextField(
        labelText: labelText,
        icon: Icons.location_on_sharp,
      ),
    ],
  );
}

Widget buildCityField(String labelText) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'City*',
        style: GoogleFonts.roboto(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(height: 5),
      AppTextField(
        labelText: labelText,
        icon: Icons.location_city,
      ),
    ],
  );
}

Widget buildAddressLine1Field(String labelText) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Address line 1*',
        style: GoogleFonts.roboto(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(height: 5),
      AppTextField(
        labelText: labelText,
        icon: Icons.push_pin,
      ),
    ],
  );
}

Widget buildAddressLinePlus() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      GestureDetector(
        onTap: () {},
        child: Text(
          'Add address line +',
          style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.accentColor,
          ),
        ),
      ),
    ],
  );
}

Widget buildPostcodeField(String labelText) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Postcode*',
        style: GoogleFonts.roboto(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(height: 5),
      AppTextField(
        labelText: labelText,
        icon: Icons.pin,
      ),
    ],
  );
}

Widget buildRecipientDetailsText() {
  return Text(
    'Recipient address',
    style: GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
  );
}

Widget buildSearchTextField() {
  return TextField(
    decoration: InputDecoration(
      hintText: 'Search',
      labelStyle: const TextStyle(color: Colors.black38),
      prefixIcon: const Icon(
        Icons.search,
        color: Colors.black38,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: Colors.black),
        borderRadius: BorderRadius.circular(10.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: Colors.black38),
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );
}

Widget buildCard(String name, String location) {
  return Card(
    color: AppColors.primaryText,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: ListTile(
      title: Text(
        name,
        style: GoogleFonts.roboto(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
      ),
      subtitle: Text(
        location,
        style: GoogleFonts.roboto(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.secondaryWhite,
        ),
      ),
      trailing: const Icon(
        Icons.edit_note_outlined,
        color: AppColors.white,
      ),
    ),
  );
}
