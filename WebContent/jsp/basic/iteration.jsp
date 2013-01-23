<!-- 
     page 78, Sams Teach Yourself JavaServer Pages in 24 Hours, 2001

     I added in Item Names.  
     The book showed itemName and itemCost, instead of itemName[] and itemCost[].
     It also used square brackets - '[' and ']' - to initialize array instead of curly braces - '{' and '}'.
 -->
<html>
	<body>
		<%!
			String itemName[] = {"Paper", "Pencil", "Eraser"};
			double itemCost[] = {123.00, 234.50, 345.50};
			double totalCost = 0.0;
		%>
		<ul>
			<%
				for(int j = 0; j < itemName.length; j++)
				{
			%>
			<li>
				 Item = <%= itemName[j] %>,
				 $<%=  itemCost[j] %>
			</li>
			<%
					totalCost = totalCost + itemCost[j];
				}
			%>
		</ul>	
		Total = <%= totalCost %>
	</body>
</html>