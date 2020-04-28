def metric(fn):
    @functools.wraps(fn)
    def wrapper(*args,**kw):
        start = time.time()
        result = fn(*args,**kw)
        end = time.time()
        print('%s executed in %s ms' % (fn.__name__, end - start))
        return result
    return wrapper

