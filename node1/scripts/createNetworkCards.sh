composer card create -p orticon-network/connection-org1.json -u PeerAdmin-org1 \
    -c crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/signcerts/Admin@org1.example.com-cert.pem \
    -k crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore/d41d4e21bf37fe0f3f6f8365b38f4f3918607975edfe44669a98cbc957b87c7e_sk \
    -r PeerAdmin -r ChannelAdmin -f PeerAdmin-org1@fabric-network.card

composer card create -p orticon-network/connection-org2.json -u PeerAdmin-org2 \
    -c crypto-config/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/signcerts/Admin@org2.example.com-cert.pem \
    -k crypto-config/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/keystore/5aa2c6b55584b5308885326b83524b57d266dc360265e9730f359438a7206710_sk \
    -r PeerAdmin -r ChannelAdmin -f PeerAdmin-org2@fabric-network.card

composer card import -f PeerAdmin-org1@fabric-network.card && composer card import -f PeerAdmin-org2@fabric-network.card