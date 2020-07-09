/*
Copyright SecureKey Technologies Inc. All Rights Reserved.

SPDX-License-Identifier: Apache-2.0
*/

import * as Aries from "@trustbloc-cicd/aries-framework-go"


export class wcredHandler {
    constructor(wcredHandler) {
        this.wcredHandler = wcredHandler
        this.eventQueue = []
    }

    addEventToQueue(event) {
        let respond
        event.respondWith = async promise => {
            respond(promise)
        };

        this.eventQueue.push(event)

        // handle for event response
        return new Promise((resolve, reject) => {
            const timer = setTimeout(_ => reject(new Error("timout waiting for credential event response")), 15000)
            respond = async (result) => {
                clearTimeout(timer)
                resolve(await result)
            }
        })
    }

    async receiveCredentialEvent() {
        let event = this.eventQueue.pop()

        return new Promise((resolve, reject) => {
            if (!event) {
                reject(event)
            }

            resolve(event)
        })
    }

}

// TODO endpoints should be read from configurations
const ariesStartupOpts = {
    assetsPath: "/base/public/aries-framework-go/assets",
    'outbound-transport': ['ws', 'http'],
    'transport-return-route': 'all',
    "http-resolver-url": ["trustbloc@http://localhost:9080/1.0/identifiers", "v1@http://localhost:9080/1.0/identifiers"],
    'agent-default-label': 'demo-user-agent',
    'auto-accept': true,
    'log-level': 'debug',
    'db-namespace': 'agent'
}

// TODO endpoints should be read from configurations
export const trustBlocStartupOpts = {
    assetsPath: '/base/public/trustbloc-agent/assets',
    blocDomain: 'testnet.trustbloc.local',
    walletMediatorURL: 'http://localhost:10093'
}


export async function loadAries() {
    return  new Aries.Framework(ariesStartupOpts)
}


export function promiseWhen(fn, timeout, interval) {
    function loop(resolve) {
        if (fn()) {
            resolve();
        }
        setTimeout(() => loop(resolve), interval ? interval : 300);
    }

    return new Promise(function (resolve, reject) {
        setTimeout(_ => reject(new Error("timout waiting for condition")), timeout ? timeout : 10000)
        loop(resolve)
    });
}
