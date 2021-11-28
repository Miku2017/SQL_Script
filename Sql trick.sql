
			-- *** Sql trick *** --

-- 1  Compare Window aggregate with Group by 


Select OrderDate=Year(OrderDate)
       ,OrderMonth=Month(orderdate)
       ,TotalDue=Sum(TotalDue)
	   ,TotalDue2=Sum(Sum(TotalDue))over() -- This is a trick 
From AdventureWorks2017.sales.SalesOrderHeader
Group by YEAR(OrderDate),Month(OrderDate)
Order by YEAR(OrderDate),Month(OrderDate);

;With CTE
 AS
    (
     Select 
	   OrderYear=Year(OrderDate),
	   OrderMonth=Month(OrderDate),
	   TotalDue=Sum(TotalDue)
	 From sales.SalesOrderHeader
	 Group by Year(Orderdate),Month(OrderDate)
	)
	Select * ,TotalSummary=Sum(TotalDue)over()
	, TotalSummary_Year=Sum(TotalDue)over(Partition By OrderYear)
	From CTE
	Order by OrderYear,OrderMonth


-- 2  Format
  Declare @Date Datetime =Getdate(),@Num  Decimal(10,4)= 63638.3435

  Select Fulldate=@Date,FullNumber=@Num
	       ,YearMonthDaye=Format(@Date,'yyyyMMdd') -- nvarchar format
		   ,Month_Name=Format(@Date,'MMMM')
		   ,Day_name=Format(@Date,'dddd')
		   ,Num_Currency=Format(@Num,'c2')
		   ,Num_Numeric=Format(@Num,'N2')

-- 3 Replicate
Declare @Person table (SSN Varchar(12))
Insert into  @Person (SSN) Values  ('721-828-8989')
Select REPLICATE('*',8)+ RIGHT(SSN,4) AS [Social Security] From @Person


-- 4 

 


