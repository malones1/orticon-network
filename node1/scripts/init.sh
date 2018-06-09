#!/bin/bash
export CHANNEL_NAME=mychannel

export CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp && 
export CORE_PEER_ADDRESS=peer0.org1.example.com:7051 && 
export CORE_PEER_LOCALMSPID="Org1MSP"

peer channel create -o orderer.example.com:7050 -c $CHANNEL_NAME -f ./channel-artifacts/channel.tx
peer channel join -b mychannel.block

export CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp && 
export CORE_PEER_ADDRESS=peer0.org2.example.com:7051 && 
export CORE_PEER_LOCALMSPID="Org2MSP"
peer channel join -b mychannel.block

# export CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp && 
# export CORE_PEER_ADDRESS=peer0.org1.example.com:7051 && 
# export CORE_PEER_LOCALMSPID="Org1MSP"

# peer channel update -o orderer.example.com:7050 -c $CHANNEL_NAME -f ./channel-artifacts/Org1MSPanchors.tx

# export CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp && 
# export CORE_PEER_ADDRESS=peer0.org2.example.com:7051 && 
# export CORE_PEER_LOCALMSPID="Org2MSP"

# peer channel update -o orderer.example.com:7050 -c $CHANNEL_NAME -f ./channel-artifacts/Org2MSPanchors.tx

# sleep 5

# export CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp && 
# export CORE_PEER_ADDRESS=peer0.org1.example.com:7051 && 
# export CORE_PEER_LOCALMSPID="Org1MSP"
# peer chaincode install -n mycc -v 1.0 -p github.com/chaincode/chaincode_example02/go/

# export CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp && 
# export CORE_PEER_ADDRESS=peer0.org2.example.com:7051 && 
# export CORE_PEER_LOCALMSPID="Org2MSP"
# peer chaincode install -n mycc -v 1.0 -p github.com/chaincode/chaincode_example02/go/

# sleep 5

# peer chaincode instantiate -o orderer.example.com:7050 -C $CHANNEL_NAME -n mycc -v 1.0 -c '{"Args":["init","a", "100", "b","200"]}' -P "OR ('Org1MSP.peer','Org2MSP.peer')"

# sleep 10

# export CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp && 
# export CORE_PEER_ADDRESS=peer0.org1.example.com:7051 && 
# export CORE_PEER_LOCALMSPID="Org1MSP"
# peer chaincode query -C $CHANNEL_NAME -n mycc -c '{"Args":["query","a"]}'

# export CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp && 
# export CORE_PEER_ADDRESS=peer0.org2.example.com:7051 && 
# export CORE_PEER_LOCALMSPID="Org2MSP"
# peer chaincode query -C $CHANNEL_NAME -n mycc -c '{"Args":["query","a"]}'

# peer chaincode invoke -o orderer.example.com:7050 -C $CHANNEL_NAME -n mycc -c '{"Args":["invoke","a","b","10"]}'

# sleep 3

# peer chaincode query -C $CHANNEL_NAME -n mycc -c '{"Args":["query","a"]}'