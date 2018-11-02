###Seathereum - Solidity Readme

We're going to start out with some basics to understand some basic development strategies moving forward.
This is what I've been doing, but you of course might have another way to do it.

So, as it stands, the first thing you'll want to do, is to open up Ganache. 
If you don't already have it, make sure to get it [here](https://truffleframework.com/ganache)

Afterwards, if possible, run `truffle migrate`. If this errors out, then the migration has already been completed. You won't notice
anything happening in Ganche. However, if it does complete, you'll notice the contract being created in a transaction, as it would
be in an actual blockchain.

Next, run `truffle console` to open up a console to interact with our blockchain.

Now, if the migration failed earlier, you're going to want to run `migrate --reset`, which will rerun the migration. This
will need to be done as it is looking at a blockchain that no longer exists. Anytime you close Ganache, you will have to rerun this.

From here, it's largely up to what the contracts look like at the time. Also, if there are website interactions, you might be able to run
the transactions from there. However, if those don't exist, you can still interact with the contract from here. In this case, I'll use the
SimpleStorage token that is currently in the contracts folder to give you an example snippet.

Two functions exist in SimpleStorage:

* get

* set

So, for one line to get the value stored in a simple token:

`SimpleStorage.deployed().then(function(instance){return instance.get()})`

Should return some number, probably in the field `c`.

This is very much still experimental territory, and I don't expect this branch to be used much outside of testing ideas, but I hope 
this helped you understand what I've done thus far.
