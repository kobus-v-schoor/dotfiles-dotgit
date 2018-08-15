#! /bin/python

import os
import time
import numpy as np

BAT = "BAT0"
CUR_CHARGE = "/sys/class/power_supply/{}/charge_now".format(BAT)
FULL_CHARGE = "/sys/class/power_supply/{}/charge_full".format(BAT)
AC_ON = "/sys/class/power_supply/{}/status".format(BAT)
INT = 60
LOW = 0.05
FLUSH = 10
MIN = 3

M_HIST = "{}/.bat".format(os.environ["HOME"])
STAT = "/tmp/bat_rem"

M = []
with open(M_HIST, "r") as f:
    M = [float(x) for x in f.readlines()]

M = np.mean(M)

with open(FULL_CHARGE, "r") as f:
    FULL = int(f.read().strip())

def level():
    with open(CUR_CHARGE, "r") as f:
        cur = int(f.read().strip())
    return cur / FULL

def status():
    with open(AC_ON, "r") as f:
        return f.read().strip() == "Discharging"

prev = False

while True:
    time.sleep(INT)
    stat = status()
    if not stat:
        if prev:
            os.remove(STAT)
        prev = False
        continue
    if prev != status():
        hist = [level()]
        times = [0]
        ms = []
        prev = True

    if len(times) < FLUSH:
        times.append(times[-1] + INT)
    else:
        hist = hist[1:]
    hist.append(level())

    A = np.vstack([np.array(times), np.ones(len(times))]).T
    om, c = np.linalg.lstsq(A, hist, rcond=None)[0]

    if len(hist) <= MIN:
        m = M
    else:
        m = om
    ts = (LOW - c) / m;
    eta = round(ts - times[-1])

    m, s = divmod(eta, 60)
    h, m = divmod(m, 60)

    h = int(h)
    m = int(m)

    ms.append(om)
    if len(ms) == FLUSH:
        with open(M_HIST, "a") as f:
            f.write("{}\n".format(np.mean(ms)))
        ms.clear()

    with open(STAT, "w") as f:
        f.write(f'{h:02}:{m:02}')
