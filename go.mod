// Copyright SecureKey Technologies Inc. All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0

module github.com/trustbloc/edge-agent

go 1.15

require (
	github.com/coreos/go-oidc v2.2.1+incompatible
	github.com/duo-labs/webauthn v0.0.0-20200714211715-1daaee874e43
	github.com/duo-labs/webauthn.io v0.0.0-20200929144140-c031a3e0f95d
	github.com/fxamacker/cbor/v2 v2.2.0
	github.com/google/uuid v1.2.0
	github.com/gorilla/sessions v1.2.1
	github.com/hyperledger/aries-framework-go v0.1.6-0.20210228202323-ef13bb35c2f4
	github.com/hyperledger/aries-framework-go/component/storageutil v0.0.0-20210225161605-5a3ea609e830
	github.com/hyperledger/aries-framework-go/spi v0.0.0-20210301162042-93c9922aa4cf
	github.com/igor-pavlenko/httpsignatures-go v0.0.21
	github.com/multiformats/go-multihash v0.0.14 // indirect
	github.com/piprate/json-gold v0.3.1-0.20201222165305-f4ce31c02ca3
	github.com/sirupsen/logrus v1.7.0 // indirect
	github.com/stretchr/testify v1.7.0
	github.com/trustbloc/edge-core v0.1.6-0.20210224175343-275d0e0370c4
	github.com/trustbloc/edv v0.1.6-0.20210212224738-ec2041a015c9
	github.com/trustbloc/kms v0.1.6-0.20210226144927-6c67cc12839f
	github.com/urfave/cli v1.22.2 // indirect
	golang.org/x/net v0.0.0-20210226172049-e18ecbb05110 // indirect
	golang.org/x/oauth2 v0.0.0-20200902213428-5d25da1a8d43
)

// Added redirect as a workaround for https://github.com/duo-labs/webauthn/issues/76
replace (
	github.com/kilic/bls12-381 => github.com/trustbloc/bls12-381 v0.0.0-20201104214312-31de2a204df8
	google.golang.org/grpc => google.golang.org/grpc v1.29.1
	google.golang.org/grpc/examples => google.golang.org/grpc/examples v1.29.1
)
