
abstract class Animal {
  String _name; 

  Animal(this._name);

  
  void makeSound();

  String getName() => _name;
}

class Lion extends Animal {
  double _maneSize; 

  Lion(String name, this._maneSize) : super(name);

  
  double get maneSize => _maneSize;

  set maneSize(double size) {
    if (size >= 0) {
      _maneSize = size;
    } else {
      throw ArgumentError("Mane size cannot be negative.");
    }
  }

  @override
  void makeSound() {
    print("Roar!");
  }
}

class Elephant extends Animal {
  double _trunkLength;

  Elephant(String name, this._trunkLength) : super(name);

  double get trunkLength => _trunkLength;

  set trunkLength(double length) {
    if (length >= 0) {
      _trunkLength = length;
    } else {
      throw ArgumentError("Trunk length cannot be negative.");
    }
  }

  @override
  void makeSound() {
    print("Trumpet!");
  }
}


class Parrot extends Animal {
  int _vocabularySize;

  Parrot(String name, this._vocabularySize) : super(name);

  int get vocabularySize => _vocabularySize;

  set vocabularySize(int size) {
    if (size >= 0) {
      _vocabularySize = size;
    } else {
      throw ArgumentError("Vocabulary size cannot be negative.");
    }
  }

  @override
  void makeSound() {
    print("Squawk!");
  }
}

void main() {
  
  List<Animal> zoo = [
    Lion("Simba", 1.5),
    Elephant("Dumbo", 2.3),
    Parrot("Polly", 50),
  ];

  
  for (var animal in zoo) {
    print("Name: ${animal.getName()}");

    
    if (animal is Lion) {
      print("Mane Size: ${animal.maneSize} meters");
    } else if (animal is Elephant) {
      print("Trunk Length: ${animal.trunkLength} meters");
    } else if (animal is Parrot) {
      print("Vocabulary Size: ${animal.vocabularySize} words");
    }

    
    print("Sound: ");
    animal.makeSound();
    print("------");
  }
}
