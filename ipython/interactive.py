from functools import partial
from csv import DictReader, DictWriter
import json

def load_path(path, operation):
    with open(path) as f:
        return operation(f)

def dump_path(path, operation):
    with open(path, 'w') as f:
        return operation(f)

def load_csv(path):
    return load_path(path, lambda f: [line for line in DictReader(f)])

def dump_csv(path, fieldnames, rows):
    def write_csv(f):
        writer = DictWriter(f, fieldnames)
        writer.writeheader()
        writer.writerows(rows)
    dump_path(path, write_csv)

def load_json(path):
    return load_path(path, json.load)

def dump_json(path, obj):
    dump_path(path, partial(json.dump, obj))
