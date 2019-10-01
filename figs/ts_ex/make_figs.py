import msprime, tskit
import os
import wf

### a tree sequence

if not os.path.exists("sim_ts"):
    os.makedirs("sim_ts")

ts = msprime.simulate(20, length=1, recombination_rate=5, random_seed=23)

for k, t in enumerate(ts.trees()):
    t.draw(path="sim_ts/sim_ts.{0:03d}.svg".format(k), width=600, tree_height_scale="log_time", max_tree_height=max(ts.tables.nodes.time))

# let make know we're done
open("sim_ts/done", "w").close()
