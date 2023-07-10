import 'package:flutter/material.dart';

class HospitalData {
  static List<Hospital> hospitals = [
    Hospital(
      name: 'Mayo Hospital',
      department:
          'General Medicine, Surgery, Orthopedics, Pediatrics, Gynecology, Obstetrics, Ophthalmology, ENT, Dermatology, Radiology, Pathology, Dentistry, Psychiatry',
      imageLink: 'https://shorturl.at/jGT24',
      area: Area(title: 'Anarkali, Lahore'),
    ),
    Hospital(
      name: 'Jinnah Hospital',
      department:
          'General Medicine, Surgery, Orthopedics, Pediatrics, Gynecology, Obstetrics, Ophthalmology, ENT, Dermatology, Radiology, Pathology, Dentistry, Psychiatry',
      imageLink:
          'https://lh3.googleusercontent.com/bip/APOwr83mdQM_HwK104YCS6Rb0vd3cKFaojcG-MHwBFdjvu3vxly0iMx_fBXoAqrfh7cdBKoQa8wjFQ-vimXo-16R4UEa-gqLKVUOFcQ0NBHduTJSZxxCD1dMN9Y2S4NCzE_9vPYT6w=w250-h200-p',
      area: Area(title: 'Garden Town, Lahore'),
    ),
    Hospital(
      name: 'Sir Ganga Ram Hospital',
      department:
          'General Medicine, Surgery, Orthopedics, Pediatrics, Gynecology, Obstetrics, Ophthalmology, ENT, Dermatology, Radiology, Pathology, Dentistry, Psychiatry',
      imageLink:
          'https://lh3.googleusercontent.com/bip/APOwr83vWVZMpad7d-MNeb1C20dCTaEvfyRO_CVVHvJ9zuPCCGpQKJJXw0st5WLatFxoawFo6mKBwDKhBpdBc_Sivzx0rIauUrl-CaCtk5K1YElIr1xp7rb8vgb6K5mUJdr7nMS17mxKLb11bRG3_19Ae7YU5cWiOY5Zib-UqEA3H9VeCXEL2_TQDu6AYTWNfeJ3vOY=w250-h200-p',
      area: Area(title: 'Garden Town, Lahore'),
    ),
    Hospital(
      name: 'Lahore General Hospital',
      department:
          'General Medicine, Surgery, Orthopedics, Pediatrics, Gynecology, Obstetrics, Ophthalmology, ENT, Dermatology, Radiology, Pathology, Dentistry, Psychiatry',
      imageLink:
          'https://lh3.googleusercontent.com/bip/APOwr808_qNHMk6RzXlGE9iUbyv7Q4zxLMhor8fySV-KujG2me0IxgBThs7C1JGU6Iil4s8Mtk9Ogelz4xxYsikT7M0GwUrYhepCKE-Itea5UATnnGYiJOEhlWPgFfH-lUVIuCF0pqEf-B9EzbX0Vvz5NwcUfkYLCY6vCav9AsydkJ3WeGcnmfdQGnT75531qhTUhlLzbw=w250-h200-p',
      area: Area(title: 'Anarkali, Lahore'),
    ),
    Hospital(
      name: 'Combined Military Hospital (CMH)',
      department:
          'General Medicine, Surgery, Orthopedics, Pediatrics, Gynecology, Obstetrics, Ophthalmology, ENT, Dermatology, Radiology, Pathology, Dentistry, Psychiatry',
      imageLink:
          'https://lh3.googleusercontent.com/bip/APOwr82j3u06RZEkcdv7sJjjETnJqxjDRRtnKSgBO8UOpxJIT2mT6AF0nJIYP3a73UQZCCF34LCQcsuBGUpjMn113Km9IyA3AsES5EVKv-l6JKURY5d2cdDk0KaovumgZdzc-Rdr_iA-F9N9o7pu2ki-v8QENxqADpdBh76tqGiTiDWjntijtLbty_F1_s697xkc3UbybfM5W1JZ1PhimbN0jTLImSyok7E=w250-h200-p',
      area: Area(title: 'Gulberg, Lahore'),
    ),
    Hospital(
      name: 'Shaikh Zayed Medical Complex',
      department:
          'General Medicine, Surgery, Orthopedics, Pediatrics, Gynecology, Obstetrics, Ophthalmology, ENT, Dermatology, Radiology, Pathology, Dentistry, Psychiatry',
      imageLink:
          'https://lh3.googleusercontent.com/bip/APOwr80yxE5qrRMetN5f4NtvfeJYMtD2h8dvXkE8MgZVdnWcH5tMZwV44r-CvHgSMtMzOYmhO2wRsT6HXb3rz9YXwwJiIcd7yuTPVph7D4qoz1lv5nDDy5aGKECza49W2f1jX4UWTMoz4cnVAqgUqAGpRJwJ=w250-h200-p',
      area: Area(title: 'Gulberg, Lahore'),
    ),
    Hospital(
      name: 'Pakistan Kidney and Liver Institute and Research Center',
      department: 'Nephrology, Urology, Gastroenterology, Hematology, Oncology',
      imageLink:
          'https://lh3.googleusercontent.com/bip/APOwr834yR3X1FJLwuDozT0pDQVuXEo3RC6SKtTi31ul6E1WVFi6uxan4bmR9tJROFc3wpzDfZ2vePnwxGWUtnf3-nfnKtOnoq_Mf2pZjDHkb-i_brCZIOsQKYreU5c1leOb7JH5mAmoA3cmtykb=w250-h200-p',
      area: Area(title: 'Johar Town, Lahore'),
    ),
    Hospital(
      name: 'Punjab Institute of Cardiology',
      department:
          'Cardiology, Cardiothoracic Surgery, Electrocardiography, Echocardiography',
      imageLink:
          'https://lh3.googleusercontent.com/bip/APOwr80dNvB1w7TtI14nhTA9Q_RCNENXFNQS4jCuq72zbeqWO-w2tqZTw3bikO7YXoiySGc5zxiqHWaoV-YC948lVbcK6Ji7Srl94LcOWB5sbILMCPI=w250-h200-p',
      area: Area(title: 'Jail Road, Lahore'),
    ),
    Hospital(
      name: 'Punjab Institute of Neurosciences',
      department: 'Neurology, Neurosurgery, Psychiatry',
      imageLink:
          'https://lh3.googleusercontent.com/bip/APOwr829IiD9yrlTRQ1RsGofkR2D980O7f0IogiXJ2mlI5EFBj1aqAshdPX3HzmLmfGX2yWpEXDbxUsa3voLSs4pJhVasC5g2Ub6JAZ-gvOORFq9y1eestG52umwPjhzhpzWZQ-NbSXn43NocAEfn3v5t66gasPPMiOJRd580-8mxW9Q2NkVvC1sEPjL7mc34cupoRCN2wXe_kOQ2vUfcuPLCA2ZOZ_MAj_hAb1HBA=w250-h200-p',
      area: Area(title: 'Jail Road, Lahore'),
    ),
    Hospital(
      name: 'Punjab Dental Hospital',
      department: 'Dentistry, Oral and Maxillofacial Surgery',
      imageLink:
          'https://lh3.googleusercontent.com/bip/APOwr83NfMRk6Y3U43xSZE41amP47w_DlB8eyhP7QwgluF36Gs66CbKqsyac5fcnp_-o_jSKKLyZNmPkHCdnbUwlW90uPIy5jWEU1sTnqp_fDOYAZ-tPo77YSiCcT7hM=w250-h200-p',
      area: Area(title: 'Jail Road, Lahore'),
    ),
    Hospital(
      name: 'United Christian Hospital',
      department:
          'General Medicine, Surgery, Orthopedics, Pediatrics, Gynecology, Obstetrics, Ophthalmology, ENT, Dermatology, Radiology, Pathology, Dentistry, Psychiatry',
      imageLink:
          'https://lh3.googleusercontent.com/bip/APOwr81nhlk75d5UVbv8NEu9IVKfPZp0ipUyJcOHZ5s11xLAzrk7W6gnKfKYmCY32i1OSpoFu5hBZnh7Zq0_SsrCBvwuTVItpVc0z_WWWUtuPQn3XeGydYD0Srjtpbz4SnnReLFrldbykHjN3zhOSXhNL4tHOuCWhM4raQBLYGWOKcHWfT_88c0KVf08ZmYmKBNJcOD3_hWT=w250-h200-p',
      area: Area(title: 'Gulberg, Lahore'),
    ),
    Hospital(
      name: 'The Childrens Hospital & Institute of Child Health',
      department:
          'Pediatrics, Neonatology, Child Neurology, Child Endocrinology',
      imageLink:
          'https://lh3.googleusercontent.com/bip/APOwr814iHq37Y0-1cPEfCbG5lWnKg4tVjXlQWymS5alIG1XDf-9OzxRDM47PxU_x9xU2qbUPL6WFPqFqZ2FXeAxzRPn_pIi3O2GJz4rpY8wLAWYhdWH_AgtqqQ=w250-h200-p',
      area: Area(title: 'Garden Town, Lahore'),
    ),
    Hospital(
      name: 'Lady Aitchison Hospital',
      department: 'Gynecology, Obstetrics, Fertility',
      imageLink:
          'https://lh3.googleusercontent.com/bip/APOwr83k-jVsWolQRb42rgavnV33oo1r6sRX39tPdOm6I4onm-Ts9UV8Yufts2Sqjhx3wkWnjoyQMcxiKRvqCNihUGcXtTjve7Pr3Bsqvd0pt5tkf27JNH8Uzd14OxTR=w250-h200-p',
      area: Area(title: 'Garden Town, Lahore'),
    ),
    Hospital(
      name: 'Lady Willingdon Hospital',
      department: 'Gynecology, Obstetrics, Fertility,',
      imageLink:
          'https://lh3.googleusercontent.com/bip/APOwr81oTZ7A1hRiGM8F7g0okmMSM1ZO3-iICdGR6yMzp-zCYcrqJhu-Eo_NH5jqJYK7Yto3b1OUrCE563R_qIHXR9MxzXb2XRx1j6QYGAmMrYvD--lGM6MnXxZF0-OWpKI9TLH4qlukCDG-yhkvG7_q_pkXP_iwg_ZfK514UM0zUc8=w250-h200-p',
      area: Area(title: 'Garden Town, Lahore'),
    ),
    Hospital(
      name: 'Shaukat Khanum Memorial Cancer Hospital and Research Centre',
      department: 'Cancer Care, Oncology, Hematology',
      imageLink:
          'https://lh3.googleusercontent.com/bip/APOwr83ae_3DdNbiMkzr2UVyYk91-LR_PtycM7h5J900_pqjSaipSIBy3h1cZ0lOEruV6NX7G8e96P-d0dJWvrfYauHCdUXabqB6fUe5nbgJId3bp10jx2y38hKXE7BRgoKTiIYzPjbN-Zbwl6jT_U4SfnX0mnDkaN_mFWYXCV9JwOZ7sUWpVOCm1kyNdRH38CqsyQM=w250-h200-p',
      area: Area(title: 'Defence, Lahore'),
    ),
    Hospital(
      name: 'Fatima Memorial Hospital',
      department:
          'General Medicine, Surgery, Orthopedics, Pediatrics, Gynecology, Obstetrics, Ophthalmology, ENT, Dermatology, Radiology, Pathology, Dentistry, Psychiatry',
      imageLink:
          'https://lh3.googleusercontent.com/bip/APOwr82cRMBALtLJSP1KU8NQpgUwntXbQGtzlp4JmMo7QoyB0vkS3XSsVUnl3wKU58htuk_YoGUQHgQ3Cvpiq_2TGnbauBT2_3eRWyVEwysev0rm6S1RgC2AdB7wdCPqS5Uyb0YE7JVhWywDXw3IgFGNrBEZuak2Q0A=w250-h200-p',
      area: Area(title: 'Shadman, Lahore'),
    ),
    Hospital(
      name: 'Doctors Hospital',
      department:
          'General Medicine, Surgery, Orthopedics, Pediatrics, Gynecology, Obstetrics, Ophthalmology, ENT, Dermatology, Radiology, Pathology, Dentistry, Psychiatry',
      imageLink:
          'https://lh3.googleusercontent.com/bip/APOwr82emBEx6LHfjW3403Mk0qiq1hg1X4SC5YTpFL5Mh75DW3aTuaYQvg4weWUB9VjhVd0IxmEWfSM9p-u9Y6EU8-CpVS45QFHuzR-0Wb3_MIaYFPrkbEze0BPqGry5Ab2q_ylCOucZsLSxfoHlL9XJ5DpWRtrSujPQaNleYgbAgjo9ZuPA3-7x8bj51xPOec9ZkyP8Hsq1rBK94Y0E6oANoVS0s-fIwyfgXg=w250-h200-p',
      area: Area(title: 'Johar Town, Lahore'),
    ),
    Hospital(
      name: 'Bahria International Hospital',
      department:
          'General Medicine, Surgery, Orthopedics, Pediatrics, Gynecology, Obstetrics, Ophthalmology, ENT, Dermatology, Radiology, Pathology, Dentistry, Psychiatry,',
      imageLink:
          'https://lh3.googleusercontent.com/bip/APOwr82Wk4Iy5uGgplDfIKtLC4UiDViORWLMjSzgMRh5_VnLh30sxbNtNzG04DA79Ne63LXcvBxU8n5gagpsKlc_rUacMShpfyqQytyekH1vvDFGR9VJsl1sWPPkVssOA55CL1fNL8eRiV4Gs5ThdFIvePRzBHEbWOU=w250-h200-p',
      area: Area(title: 'Bahria Town, Lahore'),
    ),
    Hospital(
      name: 'City Hospital',
      department:
          'General Medicine, Surgery, Orthopedics, Pediatrics, Gynecology, Obstetrics, Ophthalmology, ENT, Dermatology, Radiology, Pathology, Dentistry, Psychiatry',
      imageLink:
          'https://lh3.googleusercontent.com/bip/APOwr80ZtKTgrH3igQT26dbtSChZnrGBkFsCmz2i2OfCynyVXgvoAoqT2eGlDnedY0PE0G9Jy2Fx8RbRvoGEYyk1hyjwrtlJzsn8i4makVwl4FYLEnC-qdBRbrLnlKfy8zhkUCRK8lrzKRcGgTcsDYc7pH8qsr6nZdyK12LdCUNnotfr-L1dwuvXN4HRsgQ=w250-h200-p',
      area: Area(title: 'Defence, Lahore'),
    ),
    Hospital(
      name: 'Salam Medical Complex',
      department:
          'General Medicine, Surgery, Orthopedics, Pediatrics, Gynecology, Obstetrics, Ophthalmology, ENT, Dermatology, Radiology, Pathology, Dentistry, Psychiatry',
      imageLink:
          'https://lh3.googleusercontent.com/bip/APOwr81uME1_WA-551qRcA2jHmdH-MxiXQL1TvStADcf2tlXUs4FfsSdC-thj9A78VXggOCBTuO9zHsQ980g9Fit0siAMAR7pGnw0ScP_1eEkTvA8qBG0AUzLtaQwgVYZkiZHa-qFTxLGAREOyT_21Qr3b-zTMU4JtP4_KG5Fke_DDTJ0eKfGYA=w250-h200-p',
      area: Area(title: 'Township, Lahore'),
    ),
    Hospital(
      name: 'Farooq Hospital',
      department:
          'General Medicine, Surgery, Orthopedics, Pediatrics, Gynecology, Obstetrics, Ophthalmology, ENT, Dermatology, Radiology, Pathology, Dentistry, Psychiatry',
      imageLink:
          'https://lh3.googleusercontent.com/bip/APOwr80M1rErSNCkK9XPxqfbun6eLqDNHA6_e9jakBSlG4wzZ5Kx2rVCjSZ5RTfszFcEZXlUkxqMkyJlvn7yTLh6O4OfvTvgrIp0fpRaKSNVsHs2YrBm9TZeuLjWYVv9St4KunJ-XbFhNRT1gp8dz4DZiZyb1J5uCFHXvGr6EYPpOaHWuPP_aql9gAqPdF0=w250-h200-p',
      area: Area(title: 'Model Town, Lahore'),
    ),
    Hospital(
      name: 'Masood Hospital',
      department:
          'General Medicine, Surgery, Orthopedics, Pediatrics, Gynecology, Obstetrics, Ophthalmology, ENT, Dermatology, Radiology, Pathology, Dentistry, Psychiatry',
      imageLink:
          'https://lh3.googleusercontent.com/bip/APOwr83yUHmkE85BNCzIMjSUFFGD-nr6jHCRBNay_BJezXLUr_DhfHzbweiDtkUN0qZJrLkDky9Kf-BzDkjGNKhxV8Xz6x7A2rML1_mAwfNcFVAaBMt_hV8nc4hDTALoM2tq7hdyyQvIPXZH8RHqF51c=w250-h200-p',
      area: Area(title: 'Gulshan-e-Ravi, Lahore'),
    ),
    Hospital(
      name: 'Shalamar Hospital',
      department:
          'General Medicine, Surgery, Orthopedics, Pediatrics, Gynecology, Obstetrics, Ophthalmology, ENT, Dermatology, Radiology, Pathology, Dentistry, Psychiatry',
      imageLink:
          'https://lh3.googleusercontent.com/bip/APOwr81fu-pDoyZ0Zgb-gLU3z_VulPakMFXGH262fbx0oLgzsxg9cKbTCXVbgwz1yMDH0QVNPbaQwBgi-v51HjXFQoEFylZOEXwg5ABuo8wAGHPcQR_DvyX7kkRDnbkmAonWmw0G6soh0bu59SHAkNMX_wJ4dAHn=w250-h200-p',
      area: Area(title: 'Shalimar Link Road, Lahore'),
    ),
  ];

  static List<Area> areas = [
    Area(title: 'Anarkali, Lahore'),
    Area(title: 'Garden Town, Lahore'),
    Area(title: 'Gulberg, Lahore'),
    Area(title: 'Johar Town, Lahore'),
    Area(title: 'Jail Road, Lahore'),
    Area(title: 'Defence, Lahore'),
    Area(title: 'Shadman, Lahore'),
    Area(title: 'Bahria Town, Lahore'),
    Area(title: 'Township, Lahore'),
    Area(title: 'Model Town, Lahore'),
    Area(title: 'Gulshan-e-Ravi, Lahore'),
    Area(title: 'Shalimar Link Road, Lahore'),
    Area(title: 'Area'),
    Area(title: 'Area'),
    Area(title: 'Area'),
  ];
}

class Hospital {
  final String name;
  final String department;
  final String imageLink;
  final Area area;

  Hospital({
    required this.name,
    required this.department,
    required this.imageLink,
    required this.area,
  });
}

class Area {
  final String title;

  Area({required this.title});
}

class HospitalDetailsPage extends StatelessWidget {
  final Hospital hospital;

  const HospitalDetailsPage({required this.hospital});

  @override
  Widget build(BuildContext context) {
    List<String> departments = hospital.department.split(', ');

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(hospital.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Departments',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  GridView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          2, // Adjust the number of columns as needed
                      mainAxisSpacing: 10, // Adjust the spacing between rows
                      crossAxisSpacing:
                          10, // Adjust the spacing between columns
                      childAspectRatio:
                          2, // Adjust the aspect ratio of each button
                    ),
                    itemCount: departments.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ElevatedButton(
                        onPressed: () {
                          // Handle department button press
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(departments[index]),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'These are the Departments available in this Hospital currently',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
