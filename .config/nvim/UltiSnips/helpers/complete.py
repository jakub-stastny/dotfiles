def complete(t, opts):
  print(t, opts)
  if t:
    opts = [ m[len(t):] for m in opts if m.startswith(t) ]
  if len(opts) == 1:
    return opts[0]
  elif len(opts) > 1:
    return "(" + "|".join(opts) + ")"
  else:
    return ""

def fileNameAsConstant(snip, basename):
    chunks = basename.split('_')
    snip.rv = ''.join(chunk.title() for chunk in chunks)

