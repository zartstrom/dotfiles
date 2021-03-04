#!/usr/bin/env python
# Install i3ipc with pacman: 'pacman -S python-i3ipc'
import asyncio
from i3ipc.aio import Connection


async def main():

    sway = await Connection().connect()
    outputs = await sway.get_outputs()

    for output in outputs:
        if output.focused:
            print(output.name)


asyncio.run(main())
