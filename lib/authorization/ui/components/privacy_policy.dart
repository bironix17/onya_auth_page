import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_authorization/resources/app_fonts.dart';

class PrivacyPolicy extends StatelessWidget {
  TextStyle _commonTextStyle() => AppFonts.sfUiDisplayRegular.copyWith(
        color: Color(0xFF444444),
        fontSize: 14,
      );

  TextStyle _paragraphTextStyle() => AppFonts.sfUiDisplayBold.copyWith(
        color: Color(0xFF444444),
        fontSize: 14,
      );

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 24,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Privacy policy',
                        style: AppFonts.sfUiDisplayBold.copyWith(
                          color: Color(0xFF1E2D4C),
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'As we value the trust of our customers and take the protection of their personal information seriously, we encourage customers to read and make sure they understand this privacy policy. If there are any questions regarding its contents, we invite customers to contact our privacy team, whose contact details are contained in this policy.',
                        style: _commonTextStyle(),
                      ),
                      SizedBox(height: 20),
                      Text(
                        '1. RESPECTING YOUR PRIVACY',
                        style: _paragraphTextStyle(),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Intact Group (including Intact Group Limited ABN 77 159 767 843 and its related bodies corporate) is committed to compliance with privacy laws which apply to its businesses and which set out standards for the management of personal information. This policy outlines our personal information management practices.',
                        style: _commonTextStyle(),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Specifically:',
                        style: _commonTextStyle(),
                      ),
                      Text(
                        '• the kinds of personal information we collect and hold;',
                        style: _commonTextStyle(),
                      ),
                      Text(
                        '• how we collect and hold it;',
                        style: _commonTextStyle(),
                      ),
                      Text(
                        '• the purposes for which we collect, hold, use and disclose it;',
                        style: _commonTextStyle(),
                      ),
                      Text(
                        '• your right to access and seek correction of it;',
                        style: _commonTextStyle(),
                      ),
                      Text(
                        '• how you may complain about privacy matters; and',
                        style: _commonTextStyle(),
                      ),
                      Text(
                        '• our sharing of your personal information overseas.',
                        style: _commonTextStyle(),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'There are some matters to which this policy does not apply. These are referred to below (see clause 9 below).',
                        style: _commonTextStyle(),
                      ),
                      SizedBox(height: 20),
                      Text(
                        '2. WHAT KINDS OF PERSONAL INFORMATION DO WE COLLECT AND HOLD?',
                        style: _paragraphTextStyle(),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'The personal information we collect and hold is what is reasonably necessary for our business functions and activities. When we collect and hold personal information, it is of the following kinds: your personal details such as your name, addresses, telephone numbers, age and gender; your customer reference number or loyalty card number; whether you have taken up some of our other offerings, such as membership of our clubs and loyalty programs, and our mobile applications; any rewards and redemption details applicable to your membership of our loyalty programs; whether you have a connection with others whose personal information we may collect or hold, for example family members who may be linked to your loyalty program membership; what, how and when you buy from us or have expressed an interest in buying from us; your stated or likely preferences, for example whether you may be interested in particular products or promotions; and information about gift recipients in order to allow us to fulfil the gift purchase. The information we collect about gift recipients is not used for marketing purposes. We collect sensitive personal information from you, including health information, for the purposes including determining any public or product liability issues involving you. This information is only used to manage such issues. Depending on the nature of your dealings with us, we may collect and hold other types of personal information. For example, information collected and held via our secure financial systems about the debit or credit card you might use for your purchases from us. You generally have the option of not identifying yourself or of using a pseudonym when dealing with us, but not where this is impractical (for example when you shop online with us) or where the law or a court order provides otherwise.',
                        style: _commonTextStyle(),
                      ),
                      SizedBox(height: 20),
                      Text(
                        '3. HOW DO WE COLLECT AND HOLD PERSONAL INFORMATION?',
                        style: _paragraphTextStyle(),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Collection of personal information: When we collect personal information about you, we do so by making a record of it. We do this when: you register with us, for example to create an account, to become a member of one of our clubs or loyalty programs or to send you information; you communicate with us online; you take part in our promotions, competitions, testimonials, events, surveys or focus groups; and you deal with us in other ways involving a need for personal information to be provided such as when you contact one of our call centres or bring a claim against us. We may also collect personal information about you by accessing data from other sources and then analysing that data together with the information we already hold about you in order to learn more about your likely preferences and interests. When you visit our websites, social media pages or mobile applications or click on our advertisements on the online media of other companies, we may collect information about you using technology which is not apparent to you, for example “cookies”. For information about our use of this technology, click on this link to view our Cookie Statement. Most of the personal information we collect and hold about you is from your direct dealings with us. We may sometimes collect your personal information other than from you directly. For example from other suppliers who, in common with us, have a relationship with you. Personal information we hold is generally stored in computer systems. These may be operated by us or by our service providers. In all cases, we have rigorous information security requirements aimed at eliminating risks of unauthorised access to, and loss, misuse or wrongful alteration of, personal information.',
                        style: _commonTextStyle(),
                      ),
                      SizedBox(height: 20),
                      Text(
                        '4. Why do we collect, hold, use and disclose personal information?',
                        style: _paragraphTextStyle(),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'When we collect, hold and use your personal information, we do so primarily to sell and promote goods and services to you and to improve on the range of our offerings. For example: to learn of your likely preferences so that we may promote goods and services to you in a way which may be of most interest to you. This includes the products and services of our suppliers and other trusted partners who offer products and services that may be of interest to you; and to assist in investigating your complaints and enquiries. We disclose personal information we collect for purposes which are incidental to the sale and promotion of our goods and services to you. For example, we may disclose your personal information within our group, to service providers who assist us in our day-to-day business operations and as part of buying or selling businesses. We may collect, hold, use and disclose your personal information for other purposes which are within reasonable expectations or where permitted by law. You may opt out of our direct marketing to you. Our direct marketing materials will tell you how to do this. We may anonymise and aggregate your personal information. We may do this for use and disclosure of the anonymous data to determine preferences and shopping patterns. We share this anonymised data with our trusted partners to assist them in marketing products and services to you that are likely to be relevant to your interests and preferences.',
                        style: _commonTextStyle(),
                      ),
                      SizedBox(height: 20),
                      Text(
                        '5. HOW CAN YOU ENQUIRE ABOUT, ACCESS AND CORRECT YOUR PERSONAL INFORMATION?',
                        style: _paragraphTextStyle(),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Access to personal information: We will provide you with access to any of your personal information we hold (except in limited circumstances recognised by law). If you wish to access your personal information or have an enquiry about privacy, please contact our Privacy Officer at: privacy@woolworths.com.au or by calling us on 1300 908 631. Alternatively, you can write to us at: Privacy Officer Endeavour Group Limited Level 1, 26 Waterloo Street Surry Hills NSW 2010 Before we provide you with access to your personal information we may require some proof of identity. We may charge a reasonable fee for giving access to your personal information if your request requires substantial effort on our part. Correction of personal information: If you need to correct your personal information, please contact our Privacy Officer at one of the above contact points.',
                        style: _commonTextStyle(),
                      ),
                      SizedBox(
                        height: 80,
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: RawMaterialButton(
                    onPressed: () => Navigator.pop(context),
                    elevation: 2.0,
                    fillColor: Theme.of(context).accentColor,
                    child: Icon(
                      Icons.close,
                      size: 18.0,
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(20.0),
                    shape: CircleBorder(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/**

    Privacy policy
    As we value the trust of our customers and take the protection of their personal information seriously, we encourage customers to read and make sure they understand this privacy policy. If there are any questions regarding its contents, we invite customers to contact our privacy team, whose contact details are contained in this policy.
    1. RESPECTING YOUR PRIVACY
    Intact Group (including Intact Group Limited ABN 77 159 767 843 and its related bodies corporate) is committed to compliance with privacy laws which apply to its businesses and which set out standards for the management of personal information. This policy outlines our personal information management practices.
    Specifically:
    • the kinds of personal information we collect and hold;
    • how we collect and hold it;
    • the purposes for which we collect, hold, use and disclose it;
    • your right to access and seek correction of it;
    • how you may complain about privacy matters; and
    • our sharing of your personal information overseas.
    There are some matters to which this policy does not apply. These are referred to below (see clause 9 below).
    2. WHAT KINDS OF PERSONAL INFORMATION DO WE COLLECT AND HOLD?
    The personal information we collect and hold is what is reasonably necessary for our business functions and activities. When we collect and hold personal information, it is of the following kinds: your personal details such as your name, addresses, telephone numbers, age and gender; your customer reference number or loyalty card number; whether you have taken up some of our other offerings, such as membership of our clubs and loyalty programs, and our mobile applications; any rewards and redemption details applicable to your membership of our loyalty programs; whether you have a connection with others whose personal information we may collect or hold, for example family members who may be linked to your loyalty program membership; what, how and when you buy from us or have expressed an interest in buying from us; your stated or likely preferences, for example whether you may be interested in particular products or promotions; and information about gift recipients in order to allow us to fulfil the gift purchase. The information we collect about gift recipients is not used for marketing purposes. We collect sensitive personal information from you, including health information, for the purposes including determining any public or product liability issues involving you. This information is only used to manage such issues. Depending on the nature of your dealings with us, we may collect and hold other types of personal information. For example, information collected and held via our secure financial systems about the debit or credit card you might use for your purchases from us. You generally have the option of not identifying yourself or of using a pseudonym when dealing with us, but not where this is impractical (for example when you shop online with us) or where the law or a court order provides otherwise.
    3. HOW DO WE COLLECT AND HOLD PERSONAL INFORMATION?
    Collection of personal information: When we collect personal information about you, we do so by making a record of it. We do this when: you register with us, for example to create an account, to become a member of one of our clubs or loyalty programs or to send you information; you communicate with us online; you take part in our promotions, competitions, testimonials, events, surveys or focus groups; and you deal with us in other ways involving a need for personal information to be provided such as when you contact one of our call centres or bring a claim against us. We may also collect personal information about you by accessing data from other sources and then analysing that data together with the information we already hold about you in order to learn more about your likely preferences and interests. When you visit our websites, social media pages or mobile applications or click on our advertisements on the online media of other companies, we may collect information about you using technology which is not apparent to you, for example “cookies”. For information about our use of this technology, click on this link to view our Cookie Statement. Most of the personal information we collect and hold about you is from your direct dealings with us. We may sometimes collect your personal information other than from you directly. For example from other suppliers who, in common with us, have a relationship with you. Personal information we hold is generally stored in computer systems. These may be operated by us or by our service providers. In all cases, we have rigorous information security requirements aimed at eliminating risks of unauthorised access to, and loss, misuse or wrongful alteration of, personal information. 4. Why do we collect, hold, use and disclose personal information? When we collect, hold and use your personal information, we do so primarily to sell and promote goods and services to you and to improve on the range of our offerings. For example: to learn of your likely preferences so that we may promote goods and services to you in a way which may be of most interest to you. This includes the products and services of our suppliers and other trusted partners who offer products and services that may be of interest to you; and to assist in investigating your complaints and enquiries. We disclose personal information we collect for purposes which are incidental to the sale and promotion of our goods and services to you. For example, we may disclose your personal information within our group, to service providers who assist us in our day-to-day business operations and as part of buying or selling businesses. We may collect, hold, use and disclose your personal information for other purposes which are within reasonable expectations or where permitted by law. You may opt out of our direct marketing to you. Our direct marketing materials will tell you how to do this. We may anonymise and aggregate your personal information. We may do this for use and disclosure of the anonymous data to determine preferences and shopping patterns. We share this anonymised data with our trusted partners to assist them in marketing products and services to you that are likely to be relevant to your interests and preferences.
    5. HOW CAN YOU ENQUIRE ABOUT, ACCESS AND CORRECT YOUR PERSONAL INFORMATION?
    Access to personal information: We will provide you with access to any of your personal information we hold (except in limited circumstances recognised by law). If you wish to access your personal information or have an enquiry about privacy, please contact our Privacy Officer at: privacy@woolworths.com.au or by calling us on 1300 908 631. Alternatively, you can write to us at: Privacy Officer Endeavour Group Limited Level 1, 26 Waterloo Street Surry Hills NSW 2010 Before we provide you with access to your personal information we may require some proof of identity. We may charge a reasonable fee for giving access to your personal information if your request requires substantial effort on our part. Correction of personal information: If you need to correct your personal information, please contact our Privacy Officer at one of the above contact points.

 **/
