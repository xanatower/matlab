% ECHORECORDER Record a segment of speech and generate an echo-corrupted
% version for use in ELEN30012 Signals and Systems workshops.
%
% This script provides a graphical interface to record sound with different
% sampling rates, echo times, and echo amplitudes.
%
% Author: Xiaomin Cao 
% Modifications: Kelvin Layton
%

close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%  default parameters, will be changed with GUI
Fs=20000;
gui.t=6;
gui.a=0.5;
gui.d=0.25;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%  parameter strings
alpha=gui.a;
delay=gui.d;
gui.pro1=' Fs=';
gui.pro2='Hz   ';
gui.pro3='alpha=0.';
gui.pro4= '  Delay=0.';
gui.pro5='s  ';
gui.pro6='Speech=';
gui.pro7='s.';
gui.property=[ gui.pro1 int2str(Fs) gui.pro2 gui.pro3  int2str(gui.a*10) gui.pro4  int2str(gui.d*100) gui.pro5 gui.pro6  int2str(gui.t) gui.pro7 ];
gui.num=0;
gui.sn=int2str(gui.num);
gui.string = {'Group Number'};
gui.str='String';
gui.sty='Style';
gui.tex='Text';
gui.pos='Position';
gui.dou='double';
gui.tit1='Original Voice';
gui.tit2='Echo File';
gui.echo='group_%s_echo';
gui.posbu=[15 20 30 30];  %[gui.posbu(1) gui.posbu(2)]
figure(gui.pos,[500 400 300 235]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%  key board
gui.ht = uicontrol('Style','Text','String','Echo Recorder','Position',[gui.posbu(1)-5 gui.posbu(2)+195 120 15]);

gui.ht = uicontrol('Style','Text','String','Group Number','Position',[gui.posbu(1)-5 gui.posbu(2)-10 120 200]);
gui.h = uicontrol('Style', 'pushbutton', 'String', '1','Position', [gui.posbu(1) gui.posbu(2)+120 30 30], 'Callback', 'gui.num=gui.num*10+1;gui.sn=int2str(gui.num);gui.gui.h=uicontrol(gui.sty,gui.tex,gui.str,[gui.string,gui.sn],gui.pos,[gui.posbu(1) 180 110 30]);');
gui.h = uicontrol('Style', 'pushbutton', 'String', '2','Position', [gui.posbu(1)+40 gui.posbu(2)+120 30 30], 'Callback', 'gui.num=gui.num*10+2;gui.sn=int2str(gui.num);gui.h=uicontrol(gui.sty,gui.tex,gui.str,[gui.string,gui.sn],gui.pos,[gui.posbu(1) 180 110 30]);');
gui.h = uicontrol('Style', 'pushbutton', 'String', '3','Position', [gui.posbu(1)+80 gui.posbu(2)+120 30 30], 'Callback', 'gui.num=gui.num*10+3;gui.sn=int2str(gui.num);gui.h=uicontrol(gui.sty,gui.tex,gui.str,[gui.string,gui.sn],gui.pos,[gui.posbu(1) 180 110 30]);');
gui.h = uicontrol('Style', 'pushbutton', 'String', '4','Position', [gui.posbu(1) gui.posbu(2)+80 30 30], 'Callback', 'gui.num=gui.num*10+4;gui.sn=int2str(gui.num);gui.h=uicontrol(gui.sty,gui.tex,gui.str,[gui.string,gui.sn],gui.pos,[gui.posbu(1) 180 110 30]);');
gui.h = uicontrol('Style', 'pushbutton', 'String', '5','Position', [gui.posbu(1)+40 gui.posbu(2)+80 30 30], 'Callback', 'gui.num=gui.num*10+5;gui.sn=int2str(gui.num);gui.h=uicontrol(gui.sty,gui.tex,gui.str,[gui.string,gui.sn],gui.pos,[gui.posbu(1) 180 110 30]);');
gui.h = uicontrol('Style', 'pushbutton', 'String', '6','Position', [gui.posbu(1)+80 gui.posbu(2)+80 30 30], 'Callback', 'gui.num=gui.num*10+6;gui.sn=int2str(gui.num);gui.h=uicontrol(gui.sty,gui.tex,gui.str,[gui.string,gui.sn],gui.pos,[gui.posbu(1) 180 110 30]);');
gui.h = uicontrol('Style', 'pushbutton', 'String', '7','Position', [gui.posbu(1) gui.posbu(2)+40 30 30], 'Callback', 'gui.num=gui.num*10+7;gui.sn=int2str(gui.num);gui.h=uicontrol(gui.sty,gui.tex,gui.str,[gui.string,gui.sn],gui.pos,[gui.posbu(1) 180 110 30]);');
gui.h = uicontrol('Style', 'pushbutton', 'String', '8','Position', [gui.posbu(1)+40 gui.posbu(2)+40 30 30], 'Callback', 'gui.num=gui.num*10+8;gui.sn=int2str(gui.num);gui.h=uicontrol(gui.sty,gui.tex,gui.str,[gui.string,gui.sn],gui.pos,[gui.posbu(1) 180 110 30]);');
gui.h = uicontrol('Style', 'pushbutton', 'String', '9','Position', [gui.posbu(1)+80 gui.posbu(2)+40 30 30], 'Callback', 'gui.num=gui.num*10+9;gui.sn=int2str(gui.num);gui.h=uicontrol(gui.sty,gui.tex,gui.str,[gui.string,gui.sn],gui.pos,[gui.posbu(1) 180 110 30]);');
gui.h = uicontrol('Style', 'pushbutton', 'String', '0','Position', [gui.posbu(1)+40 gui.posbu(2) 30 30], 'Callback', 'gui.num=gui.num*10;gui.sn=int2str(gui.num);gui.h=uicontrol(gui.sty,gui.tex,gui.str,[gui.string,gui.sn],gui.pos,[gui.posbu(1) 180 110 30]);');
gui.h = uicontrol('Style', 'pushbutton', 'String', 'Del','Position', [gui.posbu(1) gui.posbu(2) 30 30], 'Callback', 'gui.num=floor(gui.num/10);gui.sn=int2str(gui.num);gui.h=uicontrol(gui.sty,gui.tex,gui.str,[gui.string,gui.sn],gui.pos,[gui.posbu(1) 180 110 30]);');
gui.h = uicontrol('Style', 'pushbutton', 'String', 'Clr','Position', [gui.posbu(1)+80 gui.posbu(2) 30 30], 'Callback', 'gui.num=gui.num*0;gui.sn=int2str(gui.num);gui.h=uicontrol(gui.sty,gui.tex,gui.str,[gui.string,gui.sn],gui.pos,[gui.posbu(1) 180 110 30]);');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% parameter control
gui.h=uicontrol(gui.sty,gui.tex,gui.str,gui.property,gui.pos,[gui.posbu(1)+120 170 80 60]);
gui.ht = uicontrol('Style','Text','String','Fs','Position',[gui.posbu(1)+205 gui.posbu(2)+110 70 90]);
gui.h=uicontrol('Style', 'pushbutton', 'String','20000Hz','Position',[gui.posbu(1)+210 185 60 20], 'Callback','Fs=20000;gui.property=[ gui.pro1 int2str(Fs) gui.pro2 gui.pro3  int2str(gui.a*10) gui.pro4  int2str(gui.d*100) gui.pro5 gui.pro6  int2str(gui.t) gui.pro7 ];gui.h=uicontrol(gui.sty,gui.tex,gui.str,gui.property,gui.pos,[gui.posbu(1)+120 170 80 60]);');
gui.h=uicontrol('Style', 'pushbutton', 'String','11025Hz','Position',[gui.posbu(1)+210 160 60 20], 'Callback','Fs=11025;gui.property=[ gui.pro1 int2str(Fs) gui.pro2 gui.pro3  int2str(gui.a*10) gui.pro4  int2str(gui.d*100) gui.pro5 gui.pro6  int2str(gui.t) gui.pro7 ];gui.h=uicontrol(gui.sty,gui.tex,gui.str,gui.property,gui.pos,[gui.posbu(1)+120 170 80 60]);');
gui.h=uicontrol('Style', 'pushbutton', 'String','8000Hz','Position',[gui.posbu(1)+210 135 60 20], 'Callback','Fs=8000;gui.property=[ gui.pro1 int2str(Fs) gui.pro2 gui.pro3  int2str(gui.a*10) gui.pro4  int2str(gui.d*100) gui.pro5 gui.pro6  int2str(gui.t) gui.pro7 ];gui.h=uicontrol(gui.sty,gui.tex,gui.str,gui.property,gui.pos,[gui.posbu(1)+120 170 80 60]);');
gui.ht = uicontrol('Style','Text','String','delay','Position',[gui.posbu(1)+205 gui.posbu(2)+20 70 90]);
gui.h=uicontrol('Style', 'pushbutton', 'String','0.5sec','Position',[gui.posbu(1)+210 95 60 20], 'Callback','gui.d=0.5;gui.property=[ gui.pro1 int2str(Fs) gui.pro2 gui.pro3  int2str(gui.a*10) gui.pro4  int2str(gui.d*100) gui.pro5 gui.pro6  int2str(gui.t) gui.pro7 ];gui.h=uicontrol(gui.sty,gui.tex,gui.str,gui.property,gui.pos,[gui.posbu(1)+120 170 80 60]);');
gui.h=uicontrol('Style', 'pushbutton', 'String','0.25sec','Position',[gui.posbu(1)+210 70 60 20], 'Callback','gui.d=0.25;gui.property=[ gui.pro1 int2str(Fs) gui.pro2 gui.pro3  int2str(gui.a*10) gui.pro4  int2str(gui.d*100) gui.pro5 gui.pro6  int2str(gui.t) gui.pro7 ];gui.h=uicontrol(gui.sty,gui.tex,gui.str,gui.property,gui.pos,[gui.posbu(1)+120 170 80 60]);');
gui.ht = uicontrol('Style','Text','String','alpha','Position',[gui.posbu(1)+205 gui.posbu(2)-10 70 60]);
gui.h=uicontrol('Style', 'pushbutton', 'String','0.9','Position',[gui.posbu(1)+210 35 27 20], 'Callback','gui.a=0.9;gui.property=[ gui.pro1 int2str(Fs) gui.pro2 gui.pro3  int2str(gui.a*10) gui.pro4  int2str(gui.d*100) gui.pro5 gui.pro6  int2str(gui.t) gui.pro7 ];gui.h=uicontrol(gui.sty,gui.tex,gui.str,gui.property,gui.pos,[gui.posbu(1)+120 170 80 60]);');
gui.h=uicontrol('Style', 'pushbutton', 'String','0.3','Position',[gui.posbu(1)+210 10 27 20], 'Callback','gui.a=0.3;gui.property=[ gui.pro1 int2str(Fs) gui.pro2 gui.pro3  int2str(gui.a*10) gui.pro4  int2str(gui.d*100) gui.pro5 gui.pro6  int2str(gui.t) gui.pro7 ];gui.h=uicontrol(gui.sty,gui.tex,gui.str,gui.property,gui.pos,[gui.posbu(1)+120 170 80 60]);');
gui.h=uicontrol('Style', 'pushbutton', 'String','0.5','Position',[gui.posbu(1)+241 35 27 20], 'Callback','gui.a=0.5;gui.property=[ gui.pro1 int2str(Fs) gui.pro2 gui.pro3  int2str(gui.a*10) gui.pro4  int2str(gui.d*100) gui.pro5 gui.pro6  int2str(gui.t) gui.pro7 ];gui.h=uicontrol(gui.sty,gui.tex,gui.str,gui.property,gui.pos,[gui.posbu(1)+120 170 80 60]);');
gui.h=uicontrol('Style', 'pushbutton', 'String','0.1','Position',[gui.posbu(1)+241 10 27 20], 'Callback','gui.a=0.1;gui.property=[ gui.pro1 int2str(Fs) gui.pro2 gui.pro3  int2str(gui.a*10) gui.pro4  int2str(gui.d*100) gui.pro5 gui.pro6  int2str(gui.t) gui.pro7 ];gui.h=uicontrol(gui.sty,gui.tex,gui.str,gui.property,gui.pos,[gui.posbu(1)+120 170 80 60]);');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% button control
gui.h=uicontrol('Style', 'pushbutton', 'String','Record','Position',[gui.posbu(1)+130 135 60 30], 'Callback','gui.x = wavrecord(gui.t*Fs, Fs, 1, gui.dou);gui.Amp=max(abs(gui.x));gui.x=gui.x./gui.Amp;figure(2);subplot(211);plot(gui.x);title(gui.tit1);y=[gui.x;zeros(round(gui.d*Fs),1)]+gui.a.*[zeros(round(gui.d*Fs),1);gui.x];gui.Amp=max(abs(y));y=y./gui.Amp;y=rot90(y);xlim([0 length(y)]);subplot(212);plot(y);title(gui.tit2);xlim([0 length(y)]);');
gui.h=uicontrol('Style', 'pushbutton', 'String','Plot','Position',[gui.posbu(1)+130 95 60 30], 'Callback','figure(3);subplot(211);plot(gui.x);title(gui.tit1);y=[gui.x;zeros(round(gui.d*Fs),1)]+gui.a.*[zeros(round(gui.d*Fs),1);gui.x];gui.Amp=max(abs(y));y=y./gui.Amp;y=rot90(y);xlim([0 length(y)]); subplot(212);plot(y);title(gui.tit2);xlim([0 length(y)]);');

gui.h=uicontrol('Style','pushbutton','String','Save','Position',[gui.posbu(1)+130 55 60 30], 'Callback','gui.stnum=sprintf(gui.echo,gui.sn);save(gui.stnum,''y'',''Fs'',''alpha'',''delay'');');

gui.h=uicontrol('Style','pushbutton','String','Play','Position',[gui.posbu(1)+130 15 60 30], 'Callback','sound(y,Fs)');