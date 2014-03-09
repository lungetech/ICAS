#!/usr/bin/env python

import sys
import subprocess
import os

cmd_list = sys.argv[1]
image = sys.argv[2]

if not os.path.exists(image):
    raise Exception("missing iamge %s" % image)

with open(cmd_list, 'r') as f:
    for line in [line.strip() for line in f]:
        if line.startswith('#'):
            continue
        
        cmd = line.split()
        output_file = 'output/%s.txt' % cmd[0]
        
        if os.path.exists(output_file):
            continue

        if '--dump-dir' in line:
            if not os.path.exists(cmd[-1]):
                os.makedirs(cmd[-1])
       
        print "running vol.py -f %s %s" % (image, line)

        p = subprocess.Popen(['vol.py', '-f', image] + cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        out, err = p.communicate()
        with open(output_file, 'w') as output:
            output.write(out)
        if len(err):
            print err 
