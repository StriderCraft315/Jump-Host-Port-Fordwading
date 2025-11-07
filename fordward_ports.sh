#!/bin/bash
MC_IP="100.90.72.7"  # Replace with your MC VPS Tailscale IP

echo "Starting Minecraft port forwarding 25500-25600..."

# Forward TCP ports 25500-25600
for port in {25500..25600}; do
    socat TCP-LISTEN:$port,fork TCP:$MC_IP:$port &
done

# Forward UDP ports 25500-25600  
for port in {25500..25600}; do
    socat UDP-LISTEN:$port,fork UDP:$MC_IP:$port &
done

echo "Port forwarding active!"
echo "Players connect to: $(curl -s ifconfig.me):25565"
echo "All ports 25500-25600 are forwarded"
echo "Processes running in background"
