function [directories,correspondence]=unshufflenames
currentpath=pwd;
path =  uigetdir;
cd(path);
% recurse two levels
d=dir(path);
d=d([d.isdir]);
%permutation key
key1=[2     1     4     7     5     6     3];
key2=[ 10     3     4     7     1     8    11     2     6     5     9];
directories={};
correspondence=[];
for i=3:max(size(d))
    cd(d(i).name);
    f=dir('*.spi');
    d(i).name
    directories{i-2}=d(i).name;

    for j=1:max(size(f))
        [name status]=strtok(f(j).name,'_');
        if ~exist([path '\' name 'ziptemp'],'dir')
%             [s,w]=system(['unzip -u ' name status ' -d ' '.\' name 'ziptemp']);
%             if (s~=0)
%                 disp('Could not unzip data');
%                 close(h);
%                 return;
%             end
        end
        fs=dir([name 'ziptemp\*.tif']);
        [name ext]=strtok(fs(1).name,'.');
        correspondence(i-2,j)=name(end-3);
    end        
    cd ('..');
end

togetherdata=[24.78	23.83	10.41	1145.29	23.57	22.66	9.62	692.86	25.17	23.93	5.45	264.29	25.49	24.38	7.73	1210.29	22.95	22.19	10.47	827	24.38	23.31	3.51	382.71	24.67	23.52	10.84	1365.71	24.77	23.59	8.23	773.86	   24.16    22.48    10.87   869.86 				24.99	24.19	5.12	286.86	24.36	23.16	5.5	492.57
24.71	23.74	10.11	1092.14	23.88	22.85	9.08	662.57	25.2	24.03	5.6	274.57	25.57	24.4	7.49	1198.43	23.23	22.43	10	790.14	24.42	23.3	3.56	364.71	24.6	23.43	10.99	1351.57	24.81	23.75	8.19	773.86	23.98	22.45	10.98	828.71	24.95	24.1	4.15	249.14	24.38	23.16	5.35	492.57
24.67	23.74	8.85	956.14	23.61	22.62	10.23	741.57	25.44	24.18	5.96	303.71	25.47	24.31	8.11	1269.43	23.09	22.26	10.01	791	24.45	23.38	3.52	378.71	24.74	23.6	10.96	1354	24.8	23.75	8.32	773.86	24.32	22.3	9.88	760.43	24.93	24.1	5.02	281	24.29	23.07	5.35	492.57
14.26	10.82	4.53	634.14	13.86	10.09	2.3	680.43	15.24	9.8	4.75	341.86	15.32	10.92	6.36	1011.29	13.23	9.85	3.07	463.14	14.56	11.06	3.44	682.86	14.9	10.26	3.12	763.86	14.43	11	2.1	533.29	14.29	10.3	5.45	722.29	14.42	10.01	3.22	495.57	14.77	10.8	3.67	678.86
14.49	10.41	5.19	731.29	13.71	9.85	2.31	643.14	15.46	9.97	4.64	329.14	15.19	10.76	6.66	1165.86	13.48	10.26	2.84	463.14	14.64	11.12	4	683.29	14.95	11.09	2.7	701.29	14.23	10.91	1.64	406.14	14.02	10.29	5.9	796.14	14.42	10.01	2.75	404.71	14.75	11.32	4.02	678.86
14.41	10.65	3.81	674.29	14.11	9.96	2.12	645.29	15.38	9.88	4.69	351.43	15.22	10.75	5.66	985.29	13.35	10.11	2.56	444.14	14.51	11.21	4.09	683.29	14.78	10.66	2.53	655.71	14.34	11	1.92	482.71	14.12	10.34	5.13	687	14.6	9.93	3.25	484.71	14.57	11.24	2.79	683.71
19.12	18.02	10.97	1107.86	18.87	17.85	6.48	635.29	19.28	18.05	7.09	403.86	19.78	18.37	12.93	1008.71	18.84	17.97	10.02	591	19.19	18.33	8.64	730.14	18.89	17.7	7.2	961.43	19.2	18.28	7.69	607.71	18.85	17.99	7.74	584.29	18.66	17.17	3.08	203.14	18.83	17.89	7.03	607.71
19.18	18.06	12.24	1242.14	19.15	18.17	6.59	666	19.39	17.97	6.02	355.43	20.06	18.67	13.11	996.29	18.9	18	10.5	567	19.13	18.34	7.89	730.14	19.01	17.67	6.77	961.43	19.26	18.5	8.27	686.43	18.84	18.17	5.88	544	17.21	16.49	2.36	162.86	19.01	18.17	7.19	610.86
19.13	18.03	12.14	1250.14	19.08	18.01	6.72	672.29	19.31	18.23	7.78	435.43	19.86	18.61	13.09	1021	18.99	18.29	10.58	560.57	19.25	18.66	7.89	721.57	19.07	17.67	7.09	957.43	19.32	18.53	7.7	577.14	18.74	18.08	6.97	544	18.7	17	2.99	203.29	18.95	18	6.95	591.14
10.71	10.44	5.59	643.29	11.71	11.07	3.93	346	11.31	10.72	5.32	250	10.97	10.56	3.14	293.43	12.4	11.7	10.66	682.43	13.99	12.97	5.23	439	11.16	10.51	6.07	315.57	11.66	10.96	5.17	522.29	13.4	12.46	6.37	439.57	12.56	11.55	4.91	284.57	11.84	11.38	7.15	836.29
10.91	10.44	5.09	610.57	12.11	11.39	3.58	313.43	11.5	10.8	5.68	250	11.1	10.64	3.06	293.43	12.6	11.79	11.56	728.14	13.84	12.62	5.45	463.43	11.18	10.59	6.79	315.57	11.58	10.88	5.44	522.29	13.26	12.37	7.07	488.14	12.65	11.63	4.99	284.57	11.82	11.3	7.09	836.29
10.94	10.44	5.19	597.14	11.99	11.07	4.01	352.86	11.47	10.72	5.21	250	10.92	10.47	3.16	293.43	12.16	11.49	11.74	739.57	13.85	12.69	5	414.86	11.15	10.59	6.31	315.57	11.63	10.96	5.36	522.29	13.22	12.3	6.58	460.71	12.07	11.42	4.49	274.14	11.91	11.39	7.43	861.86
3.72	3.56	4.93	421.14	5.37	5.16	6.31	492.14	6.25	5.47	2.38	164.29	6.5	5.6	4.52	280.29	5.8	5.32	7.01	651.71	7.75	6.71	2.53	341.14	6.61	5.89	5.15	504.43	5.84	5.08	5.07	405.43	6.84	6.14	3.48	410.71	6.56	5.68	7.03	147.71	6.98	6.66	11.12	578.29
4.29	3.83	5.62	480.86	5.46	5.22	6.15	492.14	5.93	5.19	2.53	174.86	7.15	5.89	4.38	218.86	5.97	5.42	6.79	651.71	6.57	5.77	2.34	314	6.44	5.71	4.77	460.43	5.84	5.22	5.03	402.29	6.96	6.2	3.54	379	5.22	4.81	2.67	96.29	6.74	6.05	7.8	627.86
4.29	3.88	4.84	421.14	    5.42     5.15     6.93   492.14 				6.02	5.26	2.53	174.86	6.36	5.47	4.15	261.43	5.65	5.21	7.24	651.71	6.86	6.01	2.33	314	6.61	5.89	5.15	504.43	5.46	4.88	5.27	405.43	6.97	6.26	3.85	411.43	5.83	4.88	3.76	150.57	6.58	6.11	8.48	627.86
10.18	10.13	1.93	175.86	19.58	19.4	5.39	813.43	0	0	0	0	0	0	0	0	14.64	14.53	2.36	194.86	16.47	16.28	2.59	292.14	16.5	16.14	4.85	349	19.42	18.57	2.29	224	3.22	3.22	1.54	394.71	0	0	0	0	16.05	15.91	6.16	665.43
10.22	10.17	2.07	182.43	18.98	18.61	5.09	798.57	0	0	0	0	0	0	0	0	14.66	14.53	2.55	196.29	18.22	17.99	2.1	246.14	15.63	15.26	5.5	384.71	19.37	18.56	2.39	229.29	3.28	3.28	1.53	398.29	0	0	0	0	16.08	15.91	6.18	679.29
9.53	9.42	2.03	185.43	19.51	19.34	5.02	738.14	0	0	0	0	0	0	0	0	14.66	14.56	2.67	208.29	17.2	16.99	2.33	277.86	17.25	17	4.85	339.29	19.39	18.53	2.41	233	2.28	2.27	1.54	374.43	0	0	0	0	15.95	15.79	6.7	724
5.8	4.58	3.92	631.86	4.74	4.21	3.7	789.43	6.04	4.97	2.5	176.57	5.89	4.82	2.24	471.43	6.64	5.44	2.25	369.71	5.49	4.63	2.95	1014.14	6.4	4.99	5.02	446.57	5.71	4.39	4.87	647.43	5.27	4.36	3.12	690.43	6.47	5.52	2.46	182.14	5.97	4.91	5.14	1146.86
5.31	4.24	3.9	631.86	4.99	4.27	3.16	752.57	6.56	5.14	2.71	159.71	5.63	4.67	2.76	540.29	6.46	5.16	2.74	402.57	5.23	4.59	3.26	1014.14	5.24	4.4	4.02	389.71	5.81	4.64	4.45	647.43	5.11	4.36	2.8	658.86	6.48	5.23	2.09	181.43	6.21	5.06	4.83	1165.14
5.32	4.17	3.37	631.86	4.86	4.27	3.26	752.57	6.34	5.33	2.22	137.71	5.9	4.95	2.25	455.86	6.55	5.16	2.48	402.57	5.3	4.69	3.57	1015.57	5.54	4.54	4.1	414.57	5.77	4.56	4.35	647.43	5.37	4.52	2.94	690.43	6.51	5.6	2.34	188.43	6.02	4.91	4.98	1165.14
21.8	21.64	9.56	717.14	23.81	22.92	9	513.14	22.36	22.17	12.35	1062	22.64	22.49	6.96	626.29	22.96	22.51	7.91	656.29	22.72	22.34	10.01	770.43	22.28	21.94	9.52	771.43	22.13	21.87	6.38	548.86	21.59	21.4	13.26	689.57	22.3	21.83	13.06	744.57	22.12	21.89	10.92	677.29
22.1	21.85	8.07	605.43	23.34	22.79	9.51	542.29	22.6	22.35	12.8	1138.86	21.96	21.78	7.48	650.43	23.03	22.62	7.42	630.86	22.72	22.41	9.7	766.14	22.46	22.12	10.48	801.86	22.02	21.73	6.36	540.29	21.77	21.57	10.77	570.57	22.64	21.83	14.18	808.29	22.22	22	10.5	672.14
22.16	21.89	9.75	711.71	22.97	22.54	9.72	534.86	22.24	22.05	10.58	1015.71	22.5	22.34	6.23	585.57	22.94	22.47	8.31	693.86	22.78	22.48	10.72	803.86	22	21.77	9.64	722.86	22.16	21.91	6.62	526.57	21.68	21.42	10.7	556.14	22.43	21.57	14.56	815.57	22.25	22	11.17	647.71
12.03	11.86	7.32	680.43	21.69	21.48	12.01	1297.57	7.51	7.42	2.85	1915.43	9.04	8.64	7.47	1415.29	20.63	20.27	11.24	1179.71	20.34	19.84	13.98	1488.43	8.78	8.6	4.58	1530.57	13.33	12.71	9.06	874.14	20.32	19.9	14.09	1141.43	6.49	6.44	5.21	1004.86	19.2	18.83	7.07	661
11.88	11.76	8.05	700.14	21.93	21.65	11.67	1248.86	7.41	7.32	2.98	1927.57	8.96	8.69	7.61	1506.57	20.94	20.51	8.66	1177.71	20.41	19.94	14.47	1533.57	8.84	8.74	6.55	1545.14	13.67	13.17	9.87	888.14	20.51	20.06	14.62	1126	7.1	7.05	4.95	1028.86	19.13	18.83	7.41	704.14
12.05	11.86	8.04	731.57	21.34	20.98	11.91	1298.14	7.34	7.26	4.38	1874	8.89	8.64	6.54	1463.86	20.7	20.53	11.12	1156.29	20.33	19.9	12.89	1533.57	8.93	8.71	6.37	1503.29	13.7	13.22	8.45	874.14	20.5	20.04	14.62	1126	6.44	6.39	4.74	959.71	19.26	18.91	7	693.29
																																											
																																											

27.23	26.24	0.72	198.57	19.58	19.09	1.8	838.86	31.12	30.09	2.87	1009.71	28.26	27.54	1.94	538.71	22.3	21.87	0.94	247.57	20.32	19.77	1.13	250.57	29.1	28.38	1.38	249.57	29.05	24.7	3.81	723.14	20.39	20.02	1.43	439.29	31.19	30.48	0.97	104.71	23.18	22.64	1.77	742
26.8	25.71	1.01	274.14	19.25	18.82	1.94	852.29	31.24	30.24	2.88	947.14	28.31	27.55	2.07	525.57	22.6	22.09	0.82	238.57	20.59	19.91	1.36	239.57	28.95	28.17	1.4	236.14	29.35	24.78	3.46	705.29	20.76	20.4	1.38	430.57	30.63	30.08	1.1	121.29	22.98	22.46	1.85	749.14
26.94	25.77	0.93	289	19.49	18.82	2.06	794	31.37	30.23	2.64	1003.71	28.53	27.68	1.81	523	22.24	21.8	1.14	303.43	20.62	20.01	1.58	273.71	29.05	28.46	1.47	252.43	29.36	24.76	3.16	656.71	20.36	20.02	1.26	387.86	30.68	30.14	1.16	119.29	23.1	22.59	1.73	683.43
31.19	27.87	4.44	381.57	30.34	27.44	12.01	1620.86	31.54	28.69	15.39	1808.43	31.98	28.19	8.07	1016.57	32.82	29.27	14.17	921.14	32.11	29.01	4.11	546.14	32.06	28.33	12.51	1300.57	31.43	27.72	8.52	562.14	32.12	29.24	10.97	1063.71	32.34	28.67	8.57	1315.43	30.26	27.63	15.32	1294.57
31.15	27.79	4.28	363.86	30.33	27.59	12.48	1635	31.56	28.7	15.9	1828.14	31.53	27.91	7.91	976.29	32.66	29	11.6	927.86	32.68	29.33	4.62	619.57	31.89	28.11	12.58	1295.43	30.74	27.2	7.34	484.29	32.21	29.26	10.86	1107.29	32.11	28.31	8.46	1316.14	30.83	27.88	13.83	1140.57
31.2	27.79	3.96	356.71	30.39	27.34	12.32	1688.43	31.51	28.72	16.48	1829.71	31.79	28.04	8.24	1038.43	32.56	28.97	14.55	945.57	32.05	28.92	4.14	558.71	31.87	28.22	11.62	1173.14	31.3	27.59	8.81	581.14	32.48	29.32	8.94	947.86	32.3	28.6	8.65	1298	30.42	27.72	13.93	1197.86
33.92	25.76	9.6	1488.71	36.37	27.61	8.81	1238	29.54	24.9	1.59	111.14	31.77	25.88	2.74	412.14	37.56	28.89	8	1315.71	36.35	26.74	6.16	886.43	32.63	25.59	4.84	692.43	37.26	26.8	11.8	1357.57	36.45	25.89	12.33	1270.43	29.94	24.34	2.19	206	36.19	26.51	7.06	692
33.77	25.79	10.57	1669.43	36.36	27.53	7.55	1148.14	29.35	24.9	1.46	99.14	31.61	25.63	2.73	413.29	36.78	28.06	8.26	1231	36.33	27.22	5.53	740.71	32.74	25.59	4.96	698.71	37.14	26.81	11.95	1350.86	36.65	25.86	12.01	1309	30.34	24.18	2.56	235.71	35.88	26.7	8.74	843.71
33.85	25.67	9.24	1487.86	36.35	27.79	7.9	1154	29.13	24.77	1.96	131.43	32.49	26.38	2.58	418.43	36.91	28.08	7.37	1297.14	36.34	26.81	5.71	819	32.76	25.7	4.9	686.14	37.26	26.8	12.26	1361.29	36.49	25.82	9.59	1217.71	30.1	24.15	2.18	207.29	36.24	26.61	6.83	635.29
];

averageddata=[];
for i=1:size(togetherdata,1)/3
    averageddata=[averageddata;mean(togetherdata(i*3-2:i*3,:),1)];
end

key2=[5     8     2     3    10     9     4     6    11     1     7];
lengthdatatemp=averageddata(:,1+1:4:11*4-2);
lengthdata=[];
lengthdata(:,key2)=lengthdatatemp;
difflength=abs(diff(lengthdata,1,2));
figure;
plot(difflength');
figure;
plot(mean(difflength(:,1:6)));
figure;
plot(mean(difflength(:,5:10)));

depriveddata=[12.23	11.5	5.83	1392.71	12.06	11.75	1.83	361.43	14.05	13.31	4.17	229.57	12.01	11.57	5.82	1719.57	12.7	12.08	3.47	464.43	13.28	12.71	5.86	750.29	14.21	13.27	5.12	1612.86
12.12	11.43	6.23	1539.29	12.1	11.75	1.74	341.14	14.11	13.51	3.61	236.71	12.08	11.5	5.34	1595.86	12.33	11.8	3.28	419.29	13.24	12.61	5.56	750.29	14.46	13.75	4.76	1561
11.93	11.25	5.92	1397.43	12.2	11.86	1.87	363.43	14.28	13.61	3.59	213.43	12.06	11.46	5.31	1595.86	12.37	11.76	3.41	419.29	13.51	12.92	5.73	750.29	14.2	13.47	4.71	1477.43
1.06	1	1.97	1700.29	0.7	0.7	1	780	5.4	5.33	4.56	857.43	4.05	3.92	2.37	655.29	5.94	5.79	2.48	512.14	5.48	5.29	5.5	671.43	5.25	4.96	4.23	1435
1.12	1.08	1.8	1589.14	0.7	0.7	1	780	5.31	5.26	4.78	884.57	4.18	4.02	2.16	657.29	5.9	5.73	2.33	477.71	5.67	5.47	5.3	662	5.13	4.86	4.26	1435
1.04	1.01	1.9	1698.14	0.7	0.7	1	780	5.6	5.54	4.72	896.29	4.28	4.1	2.18	600.57	5.83	5.66	2.51	512.14	5.51	5.26	4.72	582.71	5.19	4.93	4.15	1435
3.07	3.06	1.51	690.14	2.45	2.4	1.15	1063.57	4.62	4.58	2.26	377.43	3.41	3.39	1.55	1121.57	4.48	4.47	2.59	811.29	5.16	5.1	1.92	297.86	4.46	4.4	3.23	1191.86
3.83	3.55	1.18	623.14	2.4	2.34	1.23	1054	5	4.97	2.68	418.71	3.53	3.5	1.45	1162.29	4.54	4.51	2.68	831	4.68	4.53	1.82	315.57	4.29	4.23	3.29	1199.86
3.08	3.05	1.38	690.14	2.3	2.3	1.15	1014.29	4.91	4.85	2.56	411.71	4.08	4.01	1.77	1356	4.31	4.31	3.36	861.29	5.1	5.05	1.98	343.14	4.42	4.35	3.19	1126.86
26.4	20.55	8.27	1290	28.16	22.5	5.23	826.14	24.68	19.76	10.7	1359.29	13.66	12.75	3.6	619.71	23.75	18.34	9.82	1688.57	24.89	19.17	10.49	1269.71	11.46	11.05	2.62	403.14
26.48	20.44	8.16	1248.29	27.58	21.7	5.27	806.14	24.8	19.87	11.42	1456.14	13.87	12.85	3.52	627.43	24.03	19.27	10.83	1852.71	24.86	19.23	10.28	1254.43	11.47	11.05	2.52	390
26.4	20.55	8.14	1290	27.27	21.66	5.27	806.14	24.81	19.93	10.58	1417.86	13.63	12.79	3.06	512.57	23.81	18.38	10.72	1855	25.04	19.25	10.46	1255.29	11.48	11.05	2.47	390
7.08	6.83	5.98	454.14	7.89	7.01	6.2	957.86	8.49	8.39	5.62	466.57	5.36	5.32	4.92	998	5.97	5.91	6.75	749.14	6.73	6.5	3.83	321.86	3.45	3.44	6.29	1544.29
7.35	7.16	5.27	474.71	7.8	6.9	6.21	989.86	8.32	8.17	4.75	384.86	5.2	5.01	5.85	1151.71	5.69	5.67	7.24	684	6.31	6.25	3.76	315.57	3.64	3.61	5.08	1341.43
7.07	6.83	5.45	446.71	7.85	7.01	5.66	945	8.24	8.16	4.69	393.86	5.15	5.04	5.06	1021.14	6.01	5.91	7.47	784.14	6.96	6.79	4.71	388.57	3.22	3.21	6.5	1501.71
4.54	4.5	5.54	1248.43	6.67	6.64	6.68	788.29	0	0	0	0	3.13	3.11	5.69	1386.57	2.26	2.25	3.16	769	2.17	2.14	1.25	276	5.09	4.97	4.58	1457.29
4.54	4.49	5.15	1248.43	6.73	6.7	6.46	788.29	0	0	0	0	3.13	3.13	5.42	1448.57	2.26	2.25	3.16	769	2.18	2.13	1.35	275	5.04	4.89	4.65	1480.14
4.54	4.48	5.46	1214.57	6.78	6.76	6.67	830.86	0	0	0	0	3.21	3.2	5.31	1448.57	2.27	2.16	3.29	769	2.07	2.03	1.54	287.86	5.01	4.9	4.63	1457.29
14.76	13.95	1.81	993.14	16.15	14.88	2.91	802	12.44	12.06	6.34	1478	14.39	13.86	1.18	526.71	14.34	13.86	5.93	1904.57	13.81	13.41	3.39	867.43	13.7	12.83	0.93	544
14.92	14.22	1.41	775.57	16.08	14.88	3.03	842	12.52	12.13	6.42	1457.71	14.12	13.73	1.25	562.71	14.4	13.9	5.82	1867.71	14.48	13.76	3.71	928.14	14.25	13.1	0.91	550.57
14.64	14.11	1.57	879.86	16.04	14.88	3.03	802	12.55	12.1	6.28	1457.71	13.9	13.64	1.25	534.29	14.45	13.94	6.03	1858.29	13.83	13.41	3.42	854.86	13.68	12.84	0.97	561.43
19.76	18.91	16.22	2676	20.81	18.97	15.79	2676	18.56	16.38	4.09	1123.86	19.68	18.38	14.39	3884.71	17.07	16.03	3.7	1183.57	20.29	19.01	3.39	568.71	20.2	18.87	16.46	3949.29
20.06	18.95	16.22	2676	20.89	18.93	16.02	2676	18.56	16.49	4.02	1086.43	19.67	18.52	16.05	3884.71	17.06	16.16	3.51	1161.57	20.61	19.01	3.09	559.57	20.05	18.71	15.85	3763.57
20.14	19.01	15.38	2676	20.08	18.95	15.93	2676	18.57	16.46	3.87	1075.86	19.83	18.48	14.9	3917.57	17.1	16.19	3.59	1215.86	20.68	19.03	3.07	568.71	20.12	18.79	17.14	4061.71
7.09	6.41	7.53	1092.29	4.15	3.83	7.79	646.43	8.27	7.97	6.9	538.29	7.97	7.65	6.47	963.29	8.84	8.13	9.21	911.86	7.97	7.72	14.58	1253.57	6.64	6.23	13.13	1589.14
7.14	6.56	7.42	1068.29	4.15	3.82	8.98	637.57	8.69	8.44	9.66	550.71	7.55	7.16	5.84	881.86	8.31	7.87	11.78	1119.14	8.04	7.44	13.47	1151.29	6.6	6.2	9.82	1562
7.12	6.49	8.24	1169.43	4.02	3.73	9.23	766	8.4	8.15	6.65	525	8.37	7.81	5.81	909.14	8.4	7.84	9.66	955.86	7.72	7.53	13.48	1159.57	6.82	6.3	11.6	1589.14
6.1	3.85	10.01	1171.14	4.53	3	7.53	516	9.6	7.22	8.02	569.14	7.41	4.85	6.29	817.71	10.29	6.55	12.19	1261.86	8.97	6.21	11.78	1131.29	10.26	8.4	5.23	287.43
6.55	3.86	10.14	1171.14	4.76	3.46	7.5	495.14	9.8	7.16	9.28	705.57	7.05	5.13	6.93	817.71	10.14	6.32	11.79	1261.86	8.88	6.09	11.43	1131.29	10.62	9.15	4.7	300.57
6.49	3.91	10.11	1147.71	4.67	3.46	8.29	555.14	9.42	6.89	8.05	627.57	7.45	4.65	6.9	817.71	10.36	6.65	11.9	1261.86	8.88	6.16	11.66	1131.29	10.46	8.35	6.48	330.57
3.03	2.76	2.97	401.29	2.72	2.63	4.95	467.71	38.67	34.05	10.67	714.57	1.22	1.13	1.69	1118	31.88	27.65	21.88	1619	40.25	35.79	6.37	528.71	25.8	23.57	5.58	669.14
3.89	3.46	3.6	544.29	2.41	2.33	4.98	467.71	39.71	34.34	25.97	675.14	1.15	1.08	1.6	1053.14	31.91	27.62	22.88	1738.71	40.6	35.75	7.02	596.86	25.26	22.6	4.9	578
2.82	2.66	3.55	504.29	2.99	2.85	4.31	400.86	38.34	34.24	11.3	734.29	1.33	1.18	1.69	1112.86	32.39	27.65	24.87	1691.14	40.06	35.6	6.74	579.86	25.36	22.94	4.9	603
3.42	3.04	6.43	694.29	6.93	6.22	6.07	400.86	4.98	3.52	5.78	549	3.31	3.18	2.76	1119.43	3.97	3.29	5.96	814	3.96	3.49	8.75	1176.57	3.81	3.42	3.39	591.71
3.14	2.82	6.13	705	6.48	6.1	5.42	400.86	4.23	3.2	5.8	580.14	3.21	3.12	2.87	1119.29	3.87	3.2	7.03	811.86	4.34	3.79	9.39	1295.29	3.64	3.25	3.98	587
3.17	2.86	5.97	705	6.52	6.24	5.49	400.86	4.8	3.6	5.77	580.14	3.14	3.05	2.82	1082	3.76	2.97	8.02	834	3.88	3.45	9.05	1176.57	3.44	2.92	4.11	591.71
];

averageddata=[];
for i=1:size(depriveddata,1)/3
    averageddata=[averageddata;mean(depriveddata(i*3-2:i*3,:),1)];
end

key1=[2     1     7     3     5     6     4];
lengthdatatemp=[];
lengthdatatemp=averageddata(:,1+(1:4:7*4-3));
lengthdata=[];
lengthdata(:,key1)=lengthdatatemp;
difflength=abs(diff(lengthdata,1,2));
figure;
plot(difflength');
figure;
plot(mean(difflength(:,1:6)));


newdepriveddata=[2.15	2.11	2.03	1.86	5.12	563.71	1.85	1.84	1.85	1.84	4.45	570	2.08	2.06	1.94	1.8	4.68	752.86	2.46	2.41	2.35	2.19	6.96	369	1.98	1.98	1.85	1.71	3.78	725.43	1.64	1.61	1.64	1.61	3.86	599	2.22	2.16	2.1	1.91	4.51	455.14
2.13	2.11	2	1.86	5.29	550.57	1.74	1.73	1.74	1.73	4.6	570.29	1.94	1.92	1.8	1.64	3.6	657.86	2.86	2.81	2.44	1.97	8.97	367.86	1.79	2.05	1.79	1.79	3.99	761.71	1.49	1.48	1.49	1.48	4.94	567.57	2.17	2.1	2.04	1.84	5.09	473.71
2.1	2.04	1.97	1.78	3.8	520.57	1.69	1.68	1.69	1.68	3.33	483.43	1.98	1.98	1.85	1.71	3.98	704.43	2.37	2.28	2.23	2.05	3.74	368.14	2.01	2.01	2.01	2.01	5.71	951.14	1.53	1.53	1.53	1.53	3.77	561.29	1.98	1.97	1.85	1.7	4.39	447.86
10.85	10.73	10.63	10.3	2.56	208.86	9.4	9.36	8.94	8.46	2.47	290.14	15.66	13.3	15.36	13.26	6.06	584.57	10.74	10.49	10.28	9.7	3.39	465	12.39	11.63	12.17	11.58	4.39	460.43	12.94	11.8	12.82	11.63	4.49	714.29	12.31	11.72	12.18	11.55	6.85	1034.14
10.82	10.61	10.57	10.18	3.05	242.14	9.24	9.19	8.77	8.28	2.59	299	15.5	13.42	15.29	13.38	6.15	584.57	10.33	10	10	9.54	4.47	576.43	12.04	11.77	12.02	11.77	4.09	413	13.08	11.94	12.97	11.77	3.96	681.71	11.91	11.29	11.78	11.11	5.76	867.43
10.95	10.8	10.73	10.38	3.12	262.29	9.17	9.12	8.7	8.2	2.44	273	15.84	13.47	15.45	13.32	6.19	584.57	10.27	9.97	9.96	9.51	4.43	575.57	12.39	11.69	12.16	11.69	5.68	420.57	13.12	11.63	12.95	11.59	4.84	755.71	12.24	11.69	12.11	11.51	6.54	988
15.72	14.69	15.07	13.81	8.42	563.86	17.26	15.21	15.74	13.5	4.12	414.14	15.31	14.66	14.48	13.38	4.72	632.14	15.47	14.17	14.69	13.25	4.78	774.57	15.38	14.42	14.42	13.12	4.41	1175	15.55	14.82	14.68	13.55	6.83	912	15.29	14.55	14.46	13.26	5.4	702
15.84	15.01	15.01	13.75	8.19	573.43	17.13	15.01	15.59	13.27	4.26	396.14	15.03	14.39	14.47	13.49	5.03	618.43	15.85	14.75	14.95	13.48	4.98	835.86	15.15	14.27	14.18	12.95	3.99	1038.14	15.77	15.15	14.75	13.44	5.27	795.14	15.17	14.48	14.34	13.18	6.02	722.57
15.85	14.95	15.09	13.7	8.4	562.86	17.36	15.24	15.86	13.54	5.54	542.71	15.06	14.42	14.52	13.53	4.51	594.71	15.81	14.72	14.91	13.44	4.91	825.29	15.14	14.25	14.16	12.92	4.05	1106.57	15.81	15.24	14.79	13.53	6.25	887.86	15.1	14.36	14.27	13.05	5.31	637.14
22.41	19.02	21.99	18.78	13.59	611.71	22.96	19.79	22.64	19.39	9.02	550.14	23.01	19.2	22.72	18.78	11.21	683.86	21.68	18.04	21.1	17.79	18.31	989	22.41	19.48	22.27	19.46	12.08	458.86	22.22	19.6	22.05	19.37	6.97	376.14	22.04	18.81	21.67	18.38	8.25	495.29
22.67	19.51	22.33	19.1	16.14	693.86	22.9	20.1	22.56	19.47	8.38	511	22.92	19.33	22.62	18.67	12.85	745.57	21.71	18.34	21.19	18.09	23	1058	22.86	19.98	22.63	19.76	10.7	540.57	22.8	19.5	22.64	19.27	6.64	358.43	22.04	18.85	21.64	18.42	8.54	495.29
22.72	19.51	22.37	19.1	15.42	693.86	23.08	19.98	22.76	19.57	8.27	513	22.81	19.41	22.5	18.75	10.83	649.57	21.71	18.34	21.19	18.09	23	1058	22.85	20.09	22.66	19.87	9.6	513.71	23	19.57	22.84	19.34	8.06	435.14	22.08	18.74	21.69	18.31	8.39	495.29
1.89	1.88	1.89	1.88	1.74	122.86	2.03	2	1.88	1.73	2.56	210.29	2.26	2.08	2.05	1.82	1	123.71	0	0	0	0	0	0	1.73	1.53	1.45	1.15	1.27	209.71	2.13	1.98	1.93	1.71	0.8	118.71	1.2	1.19	1.2	1.19	1.14	258.71
2.39	2.24	2.21	2	3.39	140.86	2.11	2.03	1.94	1.76	1.93	242.71	2.29	2.13	2.09	1.88	0.76	77.86	0	0	0	0	0	0	2.55	2.3	1.84	1.13	1.03	190.29	3.01	2.77	2.46	1.91	0.96	108.14	1.71	1.61	1.49	1.27	0.93	217.57
2.66	2.64	2.56	2.44	1.79	105	1.96	1.87	1.79	1.59	2.33	222.86	2.02	1.83	1.79	1.53	1.1	121.43	0	0	0	0	0	0	1.84	1.67	1.6	1.34	1.06	218.43	3.06	2.71	2.46	1.83	0.84	98	1.7	1.63	1.51	1.29	0.93	228.43
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	2.27	2.18	2.23	2.18	3.25	373.29	0	0	0	0	0	0	3.54	3.52	3.23	2.9	4.58	307
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	2.3	2.3	2.3	2.3	3.37	421.43	0	0	0	0	0	0	3.01	3	2.92	2.82	4.38	298.14
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	2.5	2.49	2.39	2.28	3.01	358.14	0	0	0	0	0	0	3.17	3.14	3.08	2.98	5.04	338
13.64	13.41	13.56	13.26	7.37	390.57	14.68	14.41	14.38	13.84	9.21	294.86	13.91	13.6	13.58	12.99	8.78	469.71	14.48	14.29	14.01	13.39	11.65	303	13.92	13.67	13.43	12.72	7.49	457.14	14.22	13.6	14.19	13.56	8.35	363.43	13.97	13.55	13.47	12.6	10.09	433.71
13.93	13.46	13.7	13.13	7.25	384	14.83	14.32	14.35	13.42	8.59	257.57	14.35	14.19	13.9	13.28	8.76	473	14	13.58	13.43	12.62	10.1	257.57	14.07	13.81	13.9	13.48	7.49	457.14	13.83	13.44	13.81	13.4	7.52	346	14.28	13.89	13.61	12.53	10.16	446.86
13.39	13.14	13.31	12.98	6.3	333.71	14.72	14.36	14.44	13.8	9.5	303.86	13.96	13.66	13.64	13.06	9.91	485.71	14.37	14.01	13.86	13.09	10.45	292.57	14.03	13.79	14.01	13.76	7.88	472.86	14.19	13.47	14.16	13.47	6.56	301.57	14.04	13.5	13.53	12.54	9.84	433.14
13.89	13.63	13.54	13.03	10.18	570.29	13.55	13.37	13.06	12.4	6.26	212.71	13.31	12.67	12.91	12.03	8.87	328.29	12.52	12.36	12.33	11.99	9.47	378.86	13.29	12.9	13.03	12.55	10.52	536.71	13.88	13.55	13.64	13.21	5.58	195.29	14.04	13.85	13.55	12.92	6.83	314.14
14.02	13.67	13.65	13.07	10.85	531.43	13.75	13.56	13.57	13.22	5.37	198.71	13.77	13.35	13.45	12.74	5.71	331	12.57	12.3	12.46	12.14	9.31	390.86	13.77	13.44	13.52	13.1	11.28	609	13.77	13.26	13.43	12.92	5.56	208.57	13.93	13.54	13.42	12.58	9.81	426.57
13.89	13.45	13.48	12.84	9.13	538.57	13.6	13.44	13.09	12.48	5.3	201.29	13.78	13.31	13.46	12.69	7.44	297.43	12.69	12.41	12.51	12.05	8.58	369	13.64	13.19	13.4	12.84	8.37	493.71	13.91	13.31	13.38	12.7	6.02	247	13.56	13.17	13.18	12.55	7	304.29
6.04	5.68	5.6	4.83	5.33	857.43	5.31	5.3	4.4	3.48	4.04	286.71	4.05	4.02	3.77	3.49	8.55	684.14	4.98	4.78	4.41	3.72	3.11	543.29	4.42	3.74	4.06	3.16	3.39	1129.71	3.33	3.31	3.33	3.31	6.01	732.86	3.99	3.76	3.92	3.62	6.58	710.43
6.09	6.02	5.31	4.5	4.77	796	5.36	5.28	4.43	3.45	2.55	216.71	3.92	3.89	3.85	3.76	8.03	718.43	5.23	4.98	4.71	3.97	3.24	549.71	4.45	4.44	3.87	3.27	7.33	1173.57	3.82	3.78	3.52	3.21	5.38	801.57	4.31	4.19	4.06	3.68	6.82	770.14
5.62	5.5	5.15	4.6	4.84	810.86	5.24	5.17	4.3	3.27	2.68	287.29	3.76	3.74	3.69	3.61	6.02	637.86	4.35	4.25	4.1	3.75	2.85	473.14	4.47	4.47	3.9	3.31	5.65	1068.71	3.94	3.75	3.66	3.18	4.66	664	4.35	4.26	4.09	3.76	7.69	738.43
10.86	10.74	10.47	9.97	4.72	236	7.47	7.23	6.86	6.02	8.86	514	10.66	10.48	10.42	10.04	9.6	460.57	10.95	10.83	10.56	10.06	2.78	122.14	10.43	10.29	10.01	9.48	4.17	486.14	9.3	9.24	9.05	8.74	5.59	453	6.29	6.18	6.11	5.84	7.03	485.29
10.43	10.25	10.19	9.8	5.35	275.29	7.26	6.98	6.93	6.3	8.13	467.43	10.66	10.38	10.41	9.93	6.68	568	10.96	10.83	10.56	10.06	2.41	104.86	10.32	10.24	9.9	9.42	4.83	538.14	9.19	9.09	8.93	8.58	5.66	453	6.24	6.05	6.07	5.7	7.08	488.57
10.42	10.25	10.18	9.8	5.43	271.57	7.22	6.98	6.89	6.3	10.23	542.29	10.51	10.26	10.26	9.81	7.28	568	11.12	10.99	10.73	10.24	2.71	122.14	10.39	10.27	9.97	9.46	4.52	486.14	9.35	9.26	9.09	8.76	4.95	453	6.21	6.03	6.04	5.69	8.08	529
9.13	9.03	9.13	9.03	10	360.14	11.44	11.07	11.44	11.07	5.34	275.14	8.23	8.12	8.19	8.06	2.57	217.14	9.86	8.94	9.4	8.89	5.66	141.57	11.4	10.77	11.15	10.59	6.31	145.14	10.76	10.22	10.59	10.17	5.97	369.86	10.42	10.06	10.39	10.06	7.41	192.57
9.64	9.46	9.64	9.46	5.3	355.14	11.1	10.87	11.07	10.83	5.24	241.14	8.35	8.17	8.31	8.1	1.68	137	10.03	9.18	9.61	8.96	2.5	122.57	11.32	10.71	11.19	10.71	4.03	112.86	10.75	10.29	10.58	10.24	5.97	244.71	10.84	10.29	10.81	10.24	5.49	203.14
9.58	9.51	9.58	9.51	8.7	348	11.58	11.23	11.55	11.19	5.39	275.14	8.49	8.3	8.37	8.06	4.17	312.57	9.84	9.06	9.46	8.84	2.53	124	11.14	10.39	10.97	10.39	5.48	115.14	10.6	10.41	10.57	10.36	7.53	331.29	10.53	10.05	10.42	9.85	5.52	162.86
3.1	2.82	3.1	2.82	2.09	202.29	0	0	0	0	0	0	8.14	7.81	8.02	7.81	5.84	169.29	5.75	5.54	5.69	5.54	5.36	286.71	7.64	7.48	7.3	6.86	7.34	359.57	8.52	8.43	8.39	8.19	10.17	356	7.87	7.77	7.56	7.17	13.69	657.14
3.04	2.95	2.95	2.77	3.08	200	0	0	0	0	0	0	7.79	7.72	7.75	7.65	4.98	124.57	5.69	5.55	5.66	5.55	5.31	286.71	7.56	7.42	7.22	6.78	6.7	338.57	8.5	8.4	8.38	8.15	10.17	356	7.89	7.74	7.59	7.14	11.97	562.43
3.09	2.88	3	2.88	3.2	196.57	0	0	0	0	0	0	7.76	7.58	7.72	7.51	5.33	135.86	5.97	5.94	5.92	5.86	5.09	275	7.75	7.57	7.43	6.95	5.36	300.14	8.29	8.24	8.16	7.99	10.79	356	7.8	7.68	7.67	7.41	10.83	541.29
5.94	5.3	5.18	4.37	3.12	265.57	3.77	3.41	3.27	2.76	2.38	252.29	6.7	6.3	6.16	5.54	3.81	232.43	5.33	5.14	5.21	5.04	5.35	85.57	7.28	6.57	6.31	5.21	4.64	116	6.85	6.11	6.14	5.32	2.98	185	6.65	6.07	6.05	5.27	2.04	168
6.06	5.38	5.3	4.47	3.42	256.29	3.04	2.9	2.88	2.72	2.7	278.43	6.38	6.11	5.87	5.32	2.91	186.14	5.25	4.64	4.97	4.54	4.54	127.14	7.26	6.57	6.29	5.21	2.74	104.29	6.82	6.11	6.14	5.32	3.75	202.29	6.62	5.93	5.99	5.11	2.29	161.57
6.64	6.01	5.61	4.49	3.7	255.43	3.13	2.98	2.98	2.81	3.89	369.29	6.64	6.27	6.11	5.51	2.88	178.29	5.78	5.35	5.22	4.43	4.46	102.57	7.46	7.14	6.32	5.1	3.4	98.57	6.6	5.98	5.92	5.17	4.08	216.14	6.64	6.07	6.04	5.27	2.56	216.57
8.23	8.03	7.67	6.96	3.53	380.71	7.78	7.38	7.55	7.11	7.55	517.14	8.21	7.98	7.67	6.91	5.51	573.14	7.59	7.39	7.59	7.39	4.24	449.43	7.21	6.84	7.17	6.76	4.61	385	7.44	7.05	7.41	6.98	4.34	494.86	7.24	7.05	7.21	6.98	5.4	512.86
7.54	7.41	7.23	6.77	4.72	476.71	8	7.77	7.71	7.17	5.5	522.86	8.77	8.46	8.25	7.46	4.75	498.57	7.68	7.4	7.68	7.4	6.6	726	6.96	6.61	6.92	6.54	3.77	402.86	7.64	7.32	7.64	7.32	4.67	486	7.25	7.05	7.21	6.98	5.1	535.57
7.25	7.14	7.21	7.07	5.18	590.14	7.38	7.03	7.34	6.96	5.37	548	8.71	8.39	8.2	7.37	5.24	534.57	8.04	7.48	8	7.41	5.84	642.57	7.19	6.84	7.15	6.77	4.33	402.86	7.53	7.18	7.49	7.11	3.87	487.14	7.42	7.12	7.39	7.05	4.49	536.71
10.28	9.47	10.16	9.25	8.68	486	10.46	9.59	10.33	9.38	4.23	344.86	10.18	9.15	10.07	8.92	4.09	212.71	12.44	10.82	12.41	10.77	5.17	326	12.31	11	12.17	10.81	1.93	120.43	10.98	8.43	10.86	8.37	4.77	253	12.98	11.59	12.93	11.55	2.87	101.71
10.28	9.64	10.16	9.43	5.02	422	10.57	9.84	10.33	9.38	4.39	355.71	10	9.29	9.98	9.24	3.35	201.14	12.34	10.67	12.32	10.62	5.6	268.57	12.32	10.95	12.16	10.76	1.63	97	10.99	9.2	10.78	8.7	4.63	245.14	12.76	11.52	12.55	11.35	2.93	177.43
11.02	9.7	10.78	9.23	4.89	398.43	10.55	9.83	10.31	9.36	4.11	337	10.87	9.36	10.66	9.31	3.2	189	12.32	10.73	12.29	10.69	5.21	229.43	12.58	11.13	12.43	10.95	2.15	127.14	10.7	8.25	10.59	8.19	5.57	289.43	13.11	11.86	12.91	11.47	2.49	153.29
3.81	3.58	3.66	3.44	9.51	655.86	4.32	4.25	4.23	4.14	8.68	703	3.9	3.76	3.82	3.63	6.14	276.29	4.4	4.02	4.19	3.89	6.24	374.29	3.85	3.65	3.82	3.65	6.06	430.29	3.36	3.2	3.33	3.2	7.14	450	3.67	3.52	3.53	3.37	7.56	264.43
3.99	3.76	3.83	3.63	10.87	701.29	4.38	4.33	4.3	4.22	9.31	726.43	3.61	3.57	3.6	3.57	5.13	287.43	4.58	4.32	4.43	4.21	6.68	374.29	3.86	3.63	3.82	3.63	5.9	451.14	3.86	3.61	3.7	3.47	7.74	418	3.37	3.17	3.37	3.17	5.57	194.86
3.85	3.63	3.7	3.49	9.21	626.14	4.39	4.29	4.3	4.17	8.95	724.71	3.87	3.68	3.74	3.55	3.84	249.71	4.57	4.32	4.43	4.21	5.33	324.86	3.88	3.62	3.76	3.48	6.12	406.86	3.58	3.33	3.41	3.18	8.74	450	3.61	3.36	3.46	3.21	6.26	225.43
6.51	6.23	6.29	5.9	5.49	450.57	5.69	5.42	5.61	5.33	3.78	271.86	6.73	6.67	6.73	6.67	8.32	1072.86	6.38	6.31	6.32	6.23	3.66	408	6.46	6.31	6.25	5.99	6.15	571.57	7.54	7.06	7.5	6.99	4.9	567.86	6.32	6.09	6.27	6	4.82	791
6.08	5.82	5.99	5.73	5.05	413.71	5.6	5.45	5.35	5.07	4.31	303.57	6.45	6.41	6.45	6.41	8.52	1090.29	6.23	6.15	6.22	6.15	4.17	465.29	6.47	6.32	6.27	6	7.75	689.43	8.2	7.56	8.09	7.49	6.21	593.43	6.15	5.9	6.1	5.81	4.3	782.57
7.03	6.54	6.48	5.81	4.57	379	5.86	5.69	5.62	5.33	4.53	316.86	6.72	6.65	6.72	6.65	7.84	1026.86	6.71	6.56	6.64	6.49	3.68	402.43	6.43	6.23	6.23	5.9	7.82	727.57	7.82	7.17	7.67	6.89	4.63	454	6.16	5.75	6.11	5.66	4.52	804.43
10.81	10.1	10.59	10.05	6.32	328.43	10.46	10.21	10.19	9.76	12.01	588.43	15.57	14.99	14.96	14.13	12	995.71	11.89	11.64	11.86	11.6	12.44	522.29	15.2	14.78	14.91	14.23	13.9	1376.14	14.8	14.44	14.34	13.55	7.15	615.29	13.6	13.22	13.11	12.24	5.56	562
10.64	9.94	10.44	9.94	6.13	333.86	10.45	10.25	10.33	10.05	14.23	711.57	15.09	14.49	14.78	14.18	10.12	890.57	12.06	11.83	11.93	11.66	9.21	368.57	15.14	14.78	14.85	14.23	14.19	1376.14	14.59	14.22	14.13	13.31	7.05	609.43	14.03	13.65	13.31	12.26	5.68	562.57
10.78	10.01	10.51	9.96	5.57	306.14	10.47	10.32	10.24	9.87	11.87	557.86	15.33	14.53	14.75	13.97	11.25	1001.29	11.85	11.6	11.82	11.55	10.06	402.43	15.15	14.84	14.86	14.29	14.11	1376.14	14.34	14.03	13.87	13.11	7.1	632	13.72	13.23	13.24	12.24	4.52	443
12.52	12.23	12.52	12.23	8.06	419	13.37	12.32	13.27	12.15	5.64	346.71	14.49	13.8	14.4	13.66	9.31	749.57	14.58	14.11	14.51	13.96	2.61	125.14	15.36	14.5	15.27	14.37	8.91	507.71	14.9	14.34	14.82	14.2	8.13	642.14	15.5	15.12	15.35	14.82	4.41	264.71
12.5	12.13	12.4	11.97	7.87	441	13.09	12.08	12.99	11.92	5.68	346.71	14.44	13.82	14.35	13.68	10.12	749	14.4	13.88	14.03	13.29	3.11	143	15.47	14.62	15.26	14.31	7.19	434.86	14.43	13.88	14.35	13.73	8.12	633.14	15.65	15.22	15.49	14.92	3.21	199.29
12.7	12.14	12.46	11.76	8.6	447.29	13.47	12.24	13.38	12.08	5.88	346.71	14.5	13.78	14.41	13.64	10.06	749.57	14.53	13.85	14.14	13.26	2.96	142.14	15.18	14.23	15.09	14.2	7.43	427.14	14.88	14.29	14.8	14.15	9.01	729.86	15.46	15.01	15.3	14.71	3.57	218
17.11	15.25	16.82	14.72	11.8	660.57	17.26	14.83	17.04	14.53	13	851.57	17.5	15.49	17.28	15.2	6.94	499.43	18.13	15.29	17.61	14.45	11.68	444	18.69	16.23	17.88	15.08	17.16	1149.86	16.76	15.05	16.57	14.75	14.02	504.86	16.65	14.74	16.47	14.19	10.08	700.71
17.35	15.21	16.75	14.37	10.7	609.86	17.21	14.66	17.01	14.35	11.94	787.86	17.16	15.13	16.99	14.83	8.16	457.14	17.89	14.91	17.38	14.04	10.01	390.29	17.97	15.65	17.16	14.46	18.79	1108.86	16.78	14.9	16.59	14.59	15.86	459.86	16.95	14.67	16.77	14.36	9.97	723
16.9	14.96	16.61	14.42	11.11	633.14	17.15	14.68	16.95	14.37	13.01	806.86	17.16	15.22	17.01	14.92	7.92	451.29	17.94	14.82	17.56	14.27	9.47	530.43	18.06	15.7	17.26	14.51	24.95	1060.29	16.53	14.53	16.34	14.22	10.85	423.29	17.09	14.76	16.91	14.45	9.43	698
6.38	6.14	6.38	6.14	9.32	615.29	9.86	9.57	9.62	9.08	6.31	510.71	9.73	8.79	9.61	8.56	2.96	292.57	7.37	7.24	7.23	6.96	7.5	892.14	11.19	10.89	10.57	9.67	2.83	263	9.84	9.3	9.6	8.8	5.27	953.14	9.84	9.48	9.4	8.6	2.27	266.14
6.51	6.15	6.45	6.07	11.25	675	9.77	9.45	9.53	8.96	6.46	510.71	9.69	8.85	9.57	8.62	2.87	292.57	7.3	7.19	7.15	6.91	7.66	892.14	11.32	11.07	10.7	9.88	2.85	256.86	9.79	9.32	9.54	8.83	6.07	1057	10.11	9.78	9.4	8.4	2.49	321
6.51	6.25	6.45	6.17	8.67	615.29	9.93	9.6	9.69	9.12	7.57	510.71	9.7	8.85	9.58	8.62	2.61	275.29	7.42	7.33	7.28	7.05	7.37	892.14	11.42	11.15	10.8	9.96	2.84	261	9.68	9.23	9.43	8.73	6.18	1016.57	10.38	10.02	9.69	8.68	2.31	274.86
11.27	10.29	10.86	9.49	9.64	862.43	11.4	10.74	10.99	9.96	14.63	1594.14	12.19	11.03	11.58	9.83	15.25	1189.86	12.44	11.45	11.3	9.75	9.86	916.71	11.36	10.7	10.9	9.92	10.57	760.71	11.93	10.96	11.3	9.75	11.34	1168.14	11.87	11.18	11.18	10	10.19	942.71
11.62	10.45	11.3	10.01	12.25	808.29	11.61	10.9	11.2	10.14	12.64	1440.71	12.58	11.37	11.99	10.21	15.85	1172.71	12.18	11.22	11.03	9.49	11.86	1073	11.41	10.61	10.85	9.83	11.77	777	11.35	10.18	10.78	9.36	10.22	1062.43	11.42	10.77	11.02	10	9.21	953.29
11.46	10.65	11.04	9.87	10.48	712.57	11.47	10.81	11.06	10.04	13.26	1571.71	13.03	11.91	12.12	10.29	15.55	1197	12.25	11.67	11.33	10	9.27	927	12.32	11.02	11.31	9.82	11.21	734.57	11.71	10.54	11.17	9.75	12.24	1279.57	11.28	10.61	10.84	9.82	10.49	970.57
2.81	2.77	2.72	2.59	5.55	732.43	2.02	2.01	2.02	2.01	4.58	823.57	3.64	3.31	3.46	3.16	5.98	609.86	2.77	2.69	2.77	2.69	6.7	890.86	3.75	3.46	3.42	2.82	6.14	371.43	3	2.81	2.89	2.62	3.67	1009.71	2.76	2.67	2.76	2.67	7.6	847.57
2.43	2.43	2.43	2.43	6.49	765.57	2.19	2.18	2.19	2.18	3.96	871.71	3.35	3.15	3.17	2.99	6.04	615.71	2.99	2.62	2.75	2.42	7.61	883	3.56	3.16	3.42	2.99	3.99	402.86	3.14	2.97	3.04	2.8	4.08	1007.71	2.74	2.68	2.65	2.49	6.5	864
2.52	2.5	2.52	2.5	5.07	732.43	1.95	1.93	1.95	1.93	4.63	879.29	3.14	2.92	2.95	2.74	5.49	650.57	2.83	2.79	2.73	2.61	7.39	857.57	3.5	2.99	3.49	2.99	6.02	487.29	2.57	2.51	2.57	2.51	3.1	853.43	2.79	2.77	2.69	2.58	6.68	888.71
22.48	21.11	22.35	21.02	12.33	604.29	20.55	19.29	20.44	19.27	10.38	477.43	25.4	24.01	25.35	23.92	6.38	89.29	22.61	21.11	22.51	21.01	14.77	531.86	25.83	24.02	25.76	24.02	6.14	251.71	27.63	25.61	27.52	25.61	5.12	174.14	24.71	23.09	24.62	23.07	5.43	304
22.73	21.11	22.6	21.01	16.2	793.86	20.85	19.44	20.75	19.44	9.48	474.14	25.89	24.11	25.73	23.92	5.58	161.71	23.43	21.16	23.03	21.07	8.88	488.57	25.61	23.89	25.54	23.89	4.86	204.29	27.59	25.55	27.47	25.55	4.8	189.57	24.89	23.19	24.86	23.19	7.1	326.43
22.77	21.17	22.63	21.07	12.77	664.29	20.62	19.35	20.51	19.32	11.17	502.71	25.64	24.04	25.62	24.02	9.43	132	22.99	20.98	22.75	20.95	10.03	521.43	25.58	23.62	25.41	23.6	5.75	241.57	27.71	25.68	27.58	25.68	4.73	170.14	24.98	23.25	24.92	23.25	7.92	229.71
8.1	7.88	8.05	7.82	4.69	521.14	7.38	7.27	7.38	7.27	6.94	617.43	8.11	8.03	8.07	7.97	6.54	611.29	8.38	8.14	8.05	7.56	5.94	676.71	6.94	6.72	6.94	6.72	4.43	831.43	7.58	7.31	7.54	7.24	3.85	366	7.38	7.23	7.38	7.23	6.53	724.57
8.27	7.95	8.06	7.69	4.28	474.71	7.45	7.34	7.45	7.34	6.53	617.43	7.84	7.72	7.81	7.72	7.45	685.29	7.87	7.77	7.73	7.51	4.75	698.71	6.99	6.81	6.99	6.81	4.45	831.43	8.15	7.82	8.13	7.82	4.11	390.29	7.37	7.15	7.37	7.15	6.65	724.57
7.99	7.8	7.95	7.74	3.72	410.57	7.38	7.27	7.38	7.27	6.22	616	8.03	7.95	7.99	7.89	7.09	638	7.86	7.79	7.73	7.53	4.44	663.86	7.28	7.04	7.24	6.97	5.2	978.43	7.68	7.37	7.61	7.31	4.68	397.43	7.5	7.29	7.46	7.22	7.37	725.71
];


averageddata=[];
for i=1:size(newdepriveddata,1)/3
    averageddata=[averageddata;mean(newdepriveddata(i*3-2:i*3,:),1)];
end

key1=[2     1     7     3     5     6     4];
lengthdatatemp=[];
lengthdatatemp=averageddata(:,(1:6:7*6-5));
lengthdata=[];
lengthdata(:,key1)=lengthdatatemp;
difflength=abs(diff(lengthdata,1,2));
figure;
plot(difflength');
figure;
plot(mean(difflength(:,1:6)));
