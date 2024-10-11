% Forecast bands
% 2024-10-11
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pcolor = [0.7 0.9 0.7]
%pcolor = 2*Pantone
[px,py]= ir_plotmodelset_c(irp_T2025_ex, xlimits, pcolor)
 h1 =  patch(px,py,pcolor);
##   plot(px,py(:,1),"m-","LineWidth",1, "color", 0.5*pcolor);
##   plot(x,yp(:,2),"m-","LineWidth",1, "color", 0.5*pcolor);


%
pcolor = [0.9 0.7 0.7]
%pcolor = RoyalMail
[px,py]= ir_plotmodelset_c(irp_T2025_easy, xlimits, pcolor)
 h2 =  patch(px,py,pcolor);
% set(h2, 'facecolor', 0.9*RoyalMail)

pcolor = [0.7 0.7 0.9]
%pcolor = OxfordBlue
[px,py]=  ir_plotmodelset_c(irp_T2025_opt, xlimits, pcolor)
 h3 =  patch(px,py,pcolor);
% set(h3, 'facecolor', 1.3*OxfordBlue)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
