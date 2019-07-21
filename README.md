# apocalipsis
Apocalipsis Ethereum Smart Contract
The smart contract does not have a stop function.
The minimum payment that takes a smart contract is 0.05 ETH.
Smart contract accepts payment only before you specify the broadcast address of the one who invited you.
Accepting a payment from the user, the smart contract distributes it to five addresses in equal parts,
the first is the address that the user indicated to the staff that he invited and another 4 addresses.
The user who made the payment may be an address that other users will indicate when registering and making 
a payment only 7 times.
For the first 8000 participants, there is a possibility that they would indicate it by inviting them, 
not 7 times but 8 times, but only for the first 8000 participants.
Each of the seven new members who joined the smart contract and made the payment specifying your 
address as the user who invited them can also attract 7 (this number 8, until 8000 participants join) 
participants each. And the payment of each new participant will be distributed in the same way as yours 
into five equal parts - the five higher addresses of ethereum.
Smart contract work up and running, you can connect to the site bestroi.io
Each address of the air can participate - once!
Abi file:
[
    {
        "constant": true,
        "inputs": [],
        "name": "name",
        "outputs": [
            {
                "name": "",
                "type": "string"
            }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    },
    {
        "constant": true,
        "inputs": [],
        "name": "minBid",
        "outputs": [
            {
                "name": "",
                "type": "uint256"
            }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    },
    {
        "constant": true,
        "inputs": [],
        "name": "numMembers",
        "outputs": [
            {
                "name": "",
                "type": "uint256"
            }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    },
    {
        "constant": true,
        "inputs": [
            {
                "name": "beneficiary",
                "type": "address"
            }
        ],
        "name": "myRefFirstLevel",
        "outputs": [
            {
                "name": "",
                "type": "address[]"
            }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    },
    {
        "constant": true,
        "inputs": [
            {
                "name": "beneficiary",
                "type": "address"
            }
        ],
        "name": "meAnd4AboveMyHead",
        "outputs": [
            {
                "name": "",
                "type": "address[5]"
            }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    },
    {
        "constant": true,
        "inputs": [
            {
                "name": "beneficiary",
                "type": "address"
            }
        ],
        "name": "numRefFirstLevel",
        "outputs": [
            {
                "name": "",
                "type": "uint256"
            }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    },
    {
        "constant": false,
        "inputs": [
            {
                "name": "referal",
                "type": "address"
            }
        ],
        "name": "SendMoney",
        "outputs": [
            {
                "name": "",
                "type": "uint256"
            }
        ],
        "payable": true,
        "stateMutability": "payable",
        "type": "function"
    },
    {
        "inputs": [],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "constructor"
    },
    {
        "anonymous": false,
        "inputs": [
            {
                "indexed": true,
                "name": "sender",
                "type": "address"
            },
            {
                "indexed": true,
                "name": "referal",
                "type": "address"
            },
            {
                "indexed": false,
                "name": "value",
                "type": "uint256"
            }
        ],
        "name": "PaymentReceived",
        "type": "event"
    }
]
