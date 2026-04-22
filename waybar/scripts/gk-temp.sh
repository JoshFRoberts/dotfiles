#!/bin/bash

# prints current temp of graphics card
sensors -j nvme-pci-0100 | jq -r ".[].Composite.temp1_input"
