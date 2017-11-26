import BaseHTTPServer, SimpleHTTPServer import ssl 
httpd = BaseHTTPServer.HTTPServer(('0.0.0.0', 1358), 
SimpleHTTPServer.SimpleHTTPRequestHandler)
# generate server.pem with: openssl req -new -x509 
# -keyout server.pem -out server.pem -days 365 
# -nodes
httpd.socket = ssl.wrap_socket (httpd.socket, 
certfile='../server.pem', server_side=True)
httpd.serve_forever()
