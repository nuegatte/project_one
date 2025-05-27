// class constructor

abstract class Account {
  final String accNumb;

  Account(this.accNumb);
}

//bankaccount thing (molymorphism shit or something idk lol )
class BankAccount extends Account {
  double balance;

  BankAccount(super.accNumb, this.balance);

  void showBalance() {
    print("Your account ($accNumb) contains a balance of RM$balance!\n");
  }

  void deposit(double depoAmt) {
    double formerBalance = balance;
    balance += depoAmt;

    print(
      "Your account $accNumb, previously RM$formerBalance\nhas desposited an amount of [$depoAmt].\nCurrent Balance : RM$balance\n",
    );
  }

  void withdraw(double withdrawAmt) {
    double formerBalance = balance;
    balance -= withdrawAmt;

    print(
      "Your account $accNumb, previously RM$formerBalance\nhas withdrew an amount of [$withdrawAmt].\nCurrent Balance : RM$balance\n",
    );
  }
}

class SavingAccount extends BankAccount {
  SavingAccount(super.accNumb, super.balance);

  void addInterest(int percentage) {
    double interest = 1 + percentage / 100;
    double formerBalance = balance;

    balance *= interest;

    print(
      "Your account $accNumb, previously RM$formerBalance\nhas been given an interest of $percentage%.\nCurrent Balance : RM$balance\n",
    );
  }

  @override
  void showBalance() {
    print(
      "Your SAVINGS account ($accNumb) contains a balance of RM$balance!\n",
    );
  }
}

// main method
// void main() {
//   SavingAccount alkin = SavingAccount("2131333123", 100);

//   alkin.showBalance();
//   // alkin.deposit(1234);
//   // alkin.withdraw(33);
//   alkin.addInterest(6);
// }

//stupid ass annoying method for demo
int calculate() {
  return 7 * 7;
}
