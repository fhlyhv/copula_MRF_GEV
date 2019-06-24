id=1:0.01:16;
nid=length(id);

figure;

% for i=1:16
%     plot(id,i*ones(1,nid)); hold on;
%     plot(i*ones(1,nid),id);
% end


triplot(tri,Lng(1:256),Ltt(1:256)); hold on;

h1=plot(Lng(1:256),Ltt(1:256),'ko');
h2=plot(Lng(257:end),Ltt(257:end),'r.');

axis([1 16 1 16]);
xlabel('longitude','fontsize',14);
ylabel('latitude','fontsize',14);
h=legend([h1;h2],'observed sites','unobserved sites','Orientation','horizontal','Location','NorthOutside');
set(h,'FontSize',14,'Box','off');
