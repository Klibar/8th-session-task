enum Specialization { General, Pediatric, Surgery }

abstract class Person {
  static int userCount = 0;
  static var persons = [];
  String name;
  int age;
  Person(this.name, this.age) {
    userCount++;
    persons.add(this);
  }
}

class Doctor extends Person {
  Specialization field;
  Doctor(super.name, super.age, this.field);
}

class Insurable {
  applyInsurance() {}
}

class Patient extends Person implements Insurable {
  String? insuranceCompanyName;
  Patient(super.name, super.age);

  @override
  applyInsurance() {
    if (insuranceCompanyName != null) {
      print('insurance applayed for patient ${this.name}');
    } else {
      print('patient ${this.name} has no insurance');
    }
  }
}

void main() {
  Doctor hossam = Doctor('Doc Hossam', 32, Specialization.General);
  Doctor mohamed = Doctor('Doc Mohamed', 35, Specialization.Surgery);
  Doctor adam = Doctor('Doc Adam', 40, Specialization.Pediatric);
  Patient ahmed = Patient('ahmed', 15);
  ahmed.insuranceCompanyName = 'masr';
  Patient mai = Patient('mai', 9);
  Patient someOne = Patient('some one', 35);
  Patient jack = Patient('jack', 55);
  jack.insuranceCompanyName = 'Nile';
  Patient omar = Patient('omar', 10);
  omar.insuranceCompanyName = 'Tahrer';
  Patient amr = Patient('amr', 2);
  for (int i = 0; i < Person.userCount; i++) {
    if (Person.persons[i] is Patient) {
      if (Person.persons[i].insuranceCompanyName != null) {
        print(
          'Pationt Name is: ${Person.persons[i].name} , age is ${Person.persons[i].age} years old and insurance company name is ${Person.persons[i].insuranceCompanyName}',
        );
      } else {
        print(
          'Pationt Name is: ${Person.persons[i].name} , age is ${Person.persons[i].age} years old and no insurance availabule',
        );
      }
      Person.persons[i].applyInsurance();
    } else {
      print(
        'Doctor Name is: ${Person.persons[i].name} , age is ${Person.persons[i].age} years old , Specialization is ${Person.persons[i].field}',
      );
    }
  }
}
