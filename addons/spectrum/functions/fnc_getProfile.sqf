#include "..\script_component.hpp"

params ["_profile"];

// returns:
// [
//   _powerNoise,    // amplitude fluctuation
//   _burstiness,    // packet-like modulation
//   _frequencyDrift // carrier instability
// ]

switch (_profile) do {

    // -------------------------
    // Infantry handheld radios
    // -------------------------
    case "UNIT_RADIO": {
        [
            0.10,  // slight fading / movement
            0,     // always on when active, no burstiness
            0.02   // stable frequency synth
        ]
    };

    // -------------------------
    // Squad-level tactical radios
    // stronger, more stable, less bursty
    // -------------------------
    case "SQUAD_RADIO": {
        [
            0.08,  // stable signal due to power
            0,     // always on when active, no burstiness
            0.01   // very stable oscillator
        ]
    };

    // -------------------------
    // Base / command network WiFi
    // constant-ish digital noise
    // -------------------------
    case "WIFI": {
        [
            0.20,  // noticeable multipath variation
            0.70,  // very bursty (packets)
            0.05   // OFDM slight instability
        ]
    };

    // -------------------------
    // UAV -> Ground control, video and telemetry
    // very structured bursts, very stable carrier
    // -------------------------
    case "UAV_SOURCE": {
        [
            0.15,  // some fading and movement
            0.10,  // mostly continuous but some packetization
            0.01   // high-quality stable oscillator
        ]
    };

    // -------------------------
    // Ground control -> UAV command uplink
    // very disciplined timing, stable carrier
    // -------------------------
    case "UAV_COMMAND": {
        [
            0.10,  // stable signal
            0.70,  // short command bursts
            0.01   // very stable oscillator
        ]
    };

    // -------------------------
    // Cellphones (LTE/4G behavior)
    // very bursty, high variability
    // -------------------------
    case "CELLPHONE": {
        [
            0.35,  // strong variation (hand/body blocking)
            0.85,  // packet burst heavy
            0.10   // oscillator + network hopping
        ]
    };

    // -------------------------
    // Simple RF beacons / trackers
    // very stable periodic pulses
    // -------------------------
    case "BEACON": {
        [
            0.05,  // clean line-of-sight signal
            0,     // short clean pulses
            0.005  // crystal-stable oscillator
        ]
    };

    // -------------------------
    // Civil infrastructure (cell tower / repeater)
    // constant, stable backbone signal
    // -------------------------
    case "INFRASTRUCTURE": {
        [
            0.10,  // stable but environmental fade
            0.30,  // structured packet flow
            0.005  // highly stable reference clock
        ]
    };

    default {
        [0, 0, 0, 0]
    };
};
