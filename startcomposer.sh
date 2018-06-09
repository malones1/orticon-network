composer card create -p orticon-network/connection-org1.json -u PeerAdmin-org1 \
    -c crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/signcerts/Admin@org1.example.com-cert.pem \
    -k crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore/d41d4e21bf37fe0f3f6f8365b38f4f3918607975edfe44669a98cbc957b87c7e_sk \
    -r PeerAdmin -r ChannelAdmin -f PeerAdmin-org1@fabric-network.card

composer card create -p orticon-network/connection-org2.json -u PeerAdmin-org2 \
    -c crypto-config/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/signcerts/Admin@org2.example.com-cert.pem \
    -k crypto-config/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/keystore/5aa2c6b55584b5308885326b83524b57d266dc360265e9730f359438a7206710_sk \
    -r PeerAdmin -r ChannelAdmin -f PeerAdmin-org2@fabric-network.card

composer card import -f PeerAdmin-org1@fabric-network.card && composer card import -f PeerAdmin-org2@fabric-network.card

composer network install --card PeerAdmin-org1@fabric-network --archiveFile orticon-network/orticon-network/orticon-network@0.0.10.bna
composer network install --card PeerAdmin-org2@fabric-network --archiveFile orticon-network/orticon-network/orticon-network@0.0.10.bna

composer identity request -c PeerAdmin-org1@fabric-network -u admin -s adminpw -d alice
composer identity request -c PeerAdmin-org2@fabric-network -u admin -s adminpw -d bob

composer network start -c PeerAdmin-org1@fabric-network -n orticon-network -V 0.0.10 \
    -o endorsementPolicyFile=orticon-network/endorsement-policy.json \
    -A alice -C alice/admin-pub.pem -A bob -C bob/admin-pub.pem

composer card create -p orticon-network/connection-org1.json -u alice -n orticon-network -c alice/admin-pub.pem -k alice/admin-priv.pem
composer card create -p orticon-network/connection-org2.json -u bob -n orticon-network -c bob/admin-pub.pem -k bob/admin-priv.pem

composer card import -f alice@orticon-network.card
composer card import -f bob@orticon-network.card
