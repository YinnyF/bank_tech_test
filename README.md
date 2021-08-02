# Bank tech test

## Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

## Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## Usage

### How to run program:
IRB:
```
# instructions on how to run in IRB here.
```

### How to run tests:

```
# instructions on how to run tests here. 
```

## User Stories

```
As a client,
So that I can save money in my bank account, 
I'd like to be able to deposit money.
```

```
As a client,
So that I can use money from my bank account, 
I'd like to be able to withdraw money.
```

```
As a client,
So that I know how much money I have, 
I'd like to be able to print my balance.
```

```
As a client,
So that I can manage my budget,
I'd like to be able to see transaction dates on my account statement. 
```

```
As a client,
So that I can see the most relevant information first,
I'd like to see the transactions in reverse chronological order.
```
