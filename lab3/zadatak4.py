import urllib.request
import re
import sys


def main():
    address = sys.argv[1]
    web_page = urllib.request.urlopen(address).read().decode("utf8")
    links = re.findall('href="[^"]+"', web_page)
    print("Linkovi:")
    for i in range(len(links)):
        links[i] = links[i].replace('href="', "")[0:-1]
        print(" ", links[i])
    hosts = {}
    for link in links:
        if not "http://" in link:
            continue
        host = link.replace("http://", "").replace("www.", "")
        index = host.find("/")
        if index != -1:
            host = host[:index]
        if host in hosts:
            hosts[host] += 1
        else:
            hosts[host] = 1

    print("Hostovi:")
    for host in sorted(hosts):
        print(" ", host, "-", hosts[host])

    emails = re.findall("[^ ]+@[^ ]\.[\w]+", web_page)
    print("E-mails:")
    for email in emails:
        print(" " + email)

    pictures = re.findall('<img[\s]+src="[^"]+"[^>]+>', web_page)
    print("Broj slika:", len(pictures))

if __name__ == "__main__":
    main()
