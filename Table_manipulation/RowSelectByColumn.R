
###This is an Rscript for selecting subset of rows which have certain value in cloumns.
###This specific code can be used for selecting rows which have value greater than 5 in at least 2 columns.
###To use this code from cmd-line: Rscript RowSelectByColumn.R input_file output_file
###For example: Rscript RowSelectByColumn.R test.input.csv test.output.csv

#Take argument from user
args = commandArgs(trailingOnly=TRUE)

#Test if there is at least one argument: if not, return an error
#args[1] is required for input "CSV" file.
#args[2] is optional output file name. If not provide, file name will be "my.data.fix.csv"

if (length(args)==0) {
  stop("At least one argument must be supplied (input file).n", call.=FALSE)
} else if (length(args)==1) {
  # default output file
  args[2] = "my.data.fix.csv"
}

#Read csv input and store data in my.data
my.data = read.csv(args[1], sep=",",row.names=1)

#Select my.data that are greater than 5 in at least 2 column (in a single row)
my.data.fix = my.data[rowSums(my.data > 5) >= 2, ]

#Write results from selection to output "CSV" file
write.csv(my.data.fix, file=args[2])

#Note:this code will only work with "CSV" file. 