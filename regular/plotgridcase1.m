id=1:0.01:31;
nid=length(id);

figure;

for i=1:1:31
    plot(id,i*ones(1,nid)); hold on;
    plot(i*ones(1,nid),id);
end

h1=plot(Lng1(1:256),Ltt1(1:256),'ko');
h2=plot(Lng1(257:end),Ltt1(257:end),'r.');

axis([1 31 1 31]);
% xlabel('longitude','fontsize',14);
% ylabel('latitude','fontsize',14);
% h=legend([h1;h2],'observed sites','unobserved sites','Orientation','horizontal','Location','NorthOutside');
% set(h,'FontSize',14,'Box','off');
% hold on; colorbar(h1);