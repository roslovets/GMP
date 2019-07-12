u = udp('192.168.1.35', 25000);
%%
fopen(u);
%%
a = [0 0];
fwrite(u, a, 'int8')
%%
fclose(u);