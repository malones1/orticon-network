#!/bin/bash
rm crypto-config -r
rm channel-artifacts/*

cryptogen generate --config=./crypto-config.yaml
configtxgen -profile ComposerOrdererGenesis -outputBlock ./channel-artifacts/genesis.block
export CHANNEL_NAME=mychannel
configtxgen -profile ComposerChannel -outputCreateChannelTx ./channel-artifacts/channel.tx -channelID $CHANNEL_NAME
configtxgen -profile ComposerChannel -outputAnchorPeersUpdate ./channel-artifacts/Org1MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org1MSP
configtxgen -profile ComposerChannel -outputAnchorPeersUpdate ./channel-artifacts/Org2MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org2MSP