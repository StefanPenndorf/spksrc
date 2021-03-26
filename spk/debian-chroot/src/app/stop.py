#!/var/packages/python/target/bin/python
from application.direct import Services


if __name__ == '__main__':
    services = Services()
    services.stop_all()
