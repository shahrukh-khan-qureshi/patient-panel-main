import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Privacy Policy'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Text(
          PrivacyPolicy1.policyText,
          style: const TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}

class PrivacyPolicy1 {
  static const String policyText = '''
  Privacy Policy
  
  Effective date: [Date]
  
  Our Company ("us", "we", or "our") operates the [App Name] mobile application (hereinafter referred to as the "Service").
  
  This page informs you of our policies regarding the collection, use, and disclosure of personal data when you use our Service and the choices you have associated with that data.
  
  We use your data to provide and improve the Service. By using the Service, you agree to the collection and use of information in accordance with this policy.
  
  Information Collection and Use
  We collect several different types of information for various purposes to provide and improve our Service to you.
  
  Types of Data Collected
  Personal Data
  While using our Service, we may ask you to provide us with certain personally identifiable information that can be used to contact or identify you ("Personal Data"). Personally identifiable information may include, but is not limited to:
  
  - Email address
  - First name and last name
  - Phone number
  - Address, State, Province, ZIP/Postal code, City
  - Cookies and Usage Data
  
  Usage Data
  We may also collect information on how the Service is accessed and used ("Usage Data"). This Usage Data may include information such as your computer's Internet Protocol address (e.g., IP address), browser type, browser version, the pages of our Service that you visit, the time and date of your visit, the time spent on those pages, unique device identifiers, and other diagnostic data.
  
  Tracking & Cookies Data
  We use cookies and similar tracking technologies to track the activity on our Service and hold certain information.
  
  Examples of Cookies we use:
  - Session Cookies: We use Session Cookies to operate our Service.
  - Preference Cookies: We use Preference Cookies to remember your preferences and various settings.
  
  Use of Data
  Our Company uses the collected data for various purposes:
  - To provide and maintain the Service
  - To notify you about changes to our Service
  - To allow you to participate in interactive features of our Service when you choose to do so
  - To provide customer care and support
  - To provide analysis or valuable information so that we can improve the Service
  - To monitor the usage of the Service
  - To detect, prevent, and address technical issues
  
  Transfer of Data
  Your information, including Personal Data, may be transferred to — and maintained on — computers located outside of your state, province, country, or other governmental jurisdiction where the data protection laws may differ from those of your jurisdiction.
  
  If you are located outside [Country Name] and choose to provide information to us, please note that we transfer the data, including Personal Data, to [Country Name] and process it there.
  
  Your consent to this Privacy Policy followed by your submission of such information represents your agreement to that transfer.
  
  Our Company will take all the steps reasonably necessary to ensure that your data is treated securely and in accordance with this Privacy Policy and no transfer of your Personal Data will take place to an organization or a country unless there are adequate controls in place, including the security of your data and other personal information.
  
  Disclosure of Data
  Legal Requirements
  Our Company may disclose your Personal Data in the good faith belief that such action is necessary to:
  - Comply with a legal obligation
  - Protect and defend the rights or property of Our Company
  - Prevent or investigate possible wrongdoing in connection with the Service
  - Protect the personal safety of users of the Service or the public
  - Protect against legal liability
  
  Security of Data
  The security of your data is important to us but remember that no method of transmission over the Internet or method of electronic storage is 100% secure. While we strive to use commercially acceptable means to protect your Personal Data, we cannot guarantee its absolute security.
  
  Service Providers
  We may employ third-party companies and individuals to facilitate our Service ("Service Providers"), provide the Service on our behalf, perform Service-related services, or assist us in analyzing how our Service is used.
  
  These third parties have access to your Personal Data only to perform these tasks on our behalf and are obligated not to disclose or use it for any other purpose.
  
  Links to Other Sites
  Our Service may contain links to other sites that are not operated by us. If you click on a third-party link, you will be directed to that third party's site. We strongly advise you to review the Privacy Policy of every site you visit.
  
  Changes to This Privacy Policy
  We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page.
  
  You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.
  
  Contact Us
  If you have any questions about this Privacy Policy, please contact us:
  - By email: [Email Address]
  - By visiting this page on our website: [Website URL]
  ''';
}
