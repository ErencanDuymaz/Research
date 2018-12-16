clear all
clc

%% Read frequency values, Compute the minimum, mean and standard deviations. Write down to an excel file. 
okunmayanfile=0;

flag=[];


Files=dir('*.txt*');
mins =zeros(length(Files),1);
means=zeros(length(Files),1);
vars=zeros(length(Files),1);
written=zeros(1,4);
for k=1:length(Files)
   filename=Files(k).name;
   
   fileID = fopen(filename);

        if fileID==-1   %Kaç Tane okunamad? tespit etmek için
        okunmayanfile=okunmayanfile+1;
        end
        
      delimiter = '\t';

% Read columns of data as strings:
% For more information, see the TEXTSCAN documentation.
formatSpec = '%s%s%s%[^\n\r]';


% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter,  'ReturnOnError', false);

% Close the text file.
fclose(fileID);

% Convert the contents of columns containing numeric strings to numbers.
% Replace non-numeric strings with NaN.
raw = repmat({''},length(dataArray{1}),length(dataArray)-1);
for col=1:length(dataArray)-1
    raw(1:length(dataArray{col}),col) = dataArray{col};
end
numericData = NaN(size(dataArray{1},1),size(dataArray,2));

for col=[2,3]
    % Converts strings in the input cell array to numbers. Replaced non-numeric
    % strings with NaN.
    rawData = dataArray{col};
    for row=1:size(rawData, 1);
        % Create a regular expression to detect and remove non-numeric prefixes and
        % suffixes.
        regexstr = '(?<prefix>.*?)(?<numbers>([-]*(\d+[\,]*)+[\.]{0,1}\d*[eEdD]{0,1}[-+]*\d*[i]{0,1})|([-]*(\d+[\,]*)*[\.]{1,1}\d+[eEdD]{0,1}[-+]*\d*[i]{0,1}))(?<suffix>.*)';
        try
            result = regexp(rawData{row}, regexstr, 'names');
            numbers = result.numbers;
            
            % Detected commas in non-thousand locations.
            invalidThousandsSeparator = false;
            if any(numbers==',');
                thousandsRegExp = '^\d+?(\,\d{3})*\.{0,1}\d*$';
                if isempty(regexp(thousandsRegExp, ',', 'once'));
                    numbers = NaN;
                    invalidThousandsSeparator = true;
                end
            end
            % Convert numeric strings to numbers.
            if ~invalidThousandsSeparator;
                numbers = textscan(strrep(numbers, ',', ''), '%f');
                numericData(row, col) = numbers{1};
                raw{row, col} = numbers{1};
            end
        catch me
        end
    end
end

% Convert the contents of columns with dates to MATLAB datetimes using date
% format string.
try
    dates{1} = datetime(dataArray{1}, 'Format', 'HH:mm:ss', 'InputFormat', 'HH:mm:ss');
catch
    try
        % Handle dates surrounded by quotes
        dataArray{1} = cellfun(@(x) x(2:end-1), dataArray{1}, 'UniformOutput', false);
        dates{1} = datetime(dataArray{1}, 'Format', 'HH:mm:ss', 'InputFormat', 'HH:mm:ss');
    catch
        dates{1} = repmat(datetime([NaN NaN NaN]), size(dataArray{1}));
    end
end

anyBlankDates = cellfun(@isempty, dataArray{1});
anyInvalidDates = isnan(dates{1}.Hour) - anyBlankDates;
dates = dates(:,1);

%Split data into numeric and cell columns.
rawNumericColumns = raw(:, [2,3]);

%Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),rawNumericColumns); % Find non-numeric cells
rawNumericColumns(R) = {NaN}; % Replace non-numeric cells

% Allocate imported array to column variable names
VarName1 = dates{:, 1};
VarName2 = cell2mat(rawNumericColumns(:, 1));
VarName3 = cell2mat(rawNumericColumns(:, 2));

% For code requiring serial dates (datenum) instead of datetime, uncomment
% the following line(s) below to return the imported dates as datenum(s).

% VarName1=datenum(VarName1);


% Clear temporary variables
time=VarName1;
freq=VarName3/1000; 
        
mincik=min(freq);
meancik=mean(freq);
varyanscik=var(freq);
if mincik<49.8
    flag=[flag filename];
    
end
% 
mins(k)= mincik;
means(k)=meancik;
vars(k)=sqrt(varyanscik);
written= [cellstr(filename) mincik meancik vars(k)]; 
xlRange=['A' int2str(k+1) ':D' int2str(k+1)]
xlswrite('dec_to_march_2013.xlsx',written,xlRange);
clearvars VarName1 VarName2 VarName3 delimiter formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp me dates blankDates anyBlankDates invalidDates anyInvalidDates rawNumericColumns R;
 

        
end

%% Make a graph of mean values

xlRange='C2:C182';
mean_freq=xlsread('dec_to_march_2013.xlsx',xlRange);

xlRange='E2:E182';

[a b c] = xlsread('dec_to_march_2013.xlsx','E2:E182');


num = datenum( b, 'DD/MM/YYYY' );

time = datetime(b,'InputFormat','dd/MM/yyyy')

t1 = datetime(2013,12,23,00,00,0);
t2 = datetime(2013,12,23,23,59,59);
t = t1:seconds(1):t2 ;

t3 = datetime(2013,12,23,22,14,30);
t4 = datetime(2013,12,23,22,20,0);

plot(t,freq,'k','LineWidth',2)

xlim([41630.926389, 41630.930556])
ylim([49 50])