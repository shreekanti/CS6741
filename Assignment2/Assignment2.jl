### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ d2ed0d00-7e7b-11eb-2018-f37d5a0bd2cd
using DataFrames

# ╔═╡ f7ef7a00-7e8c-11eb-284d-a1b4b1ec4a6d
using Random

# ╔═╡ 0669a66e-7f3a-11eb-087c-6310b21a0f63
using Dates

# ╔═╡ 4fe60d3e-7eb1-11eb-04cf-738128d2fd60
begin
	using JSON
	using HTTP
	api_link = "https://api.covid19india.org/data.json"
	HTTP_req = HTTP.get(api_link)
	df4=vcat(DataFrame.(JSON.parse(String(HTTP_req.body))["cases_time_series"])...)
end

# ╔═╡ 9ea24040-7f40-11eb-3145-d95948167bbc
begin
	using Plots
	pyplot()
	using StatPlots
end

# ╔═╡ 25901ac0-7e95-11eb-0087-07cb1d3ba51d
md"# Problem 1"

# ╔═╡ d2b42d40-7e7c-11eb-004e-8b18c5dbcfd4
begin
	df = DataFrame(
	religion =  ["Agnostic", "Atheist", "Buddhist", "Catholic", "Don't know/refused", "Evangelical Prot", "Hindu", "Historical Black Prot", "Jehovah's Witness", "Jewish"], 
	C2 = [12,16,18,0,1,109,345,567,78,89], 
	C3 = [45,234,708,5678,90,67,76,777,0,1], 
	C4 = [345,789,90,67,799,1432,677,555,454,34], 
	C5 = [76, 35, 33, 638, 10, 881, 11, 197, 21, 30],
	C6 = [0,2345,61,6,7,12,81,67,72,200],
	C7 = [34, 27, 21, 617, 14, 869, 9, 244, 27, 19],
	C8 = [rand(1:100) for _ in 1:10],
	C9 = [rand(1:100) for _ in 1:10],
	C10 =[rand(1:100) for _ in 1:10],
	C11 =[rand(1:100) for _ in 1:10]
		
)
end

# ╔═╡ 59a90300-7e89-11eb-189e-47f8753a1096
rename!(df,"C2" => "<\$10k","C3" => "\$10-20k", "C4" => "\$20-30k", "C5" => "\$30-40k","C6" => "\$40-50k", "C7" => "\$50-75k", "C8" => "\$75-100k", "C9"=> "\$100-150k" ,"C10" => ">150k" , "C11" => "Don't know/ refused" )

# ╔═╡ dc9a52e0-7e8a-11eb-333a-f7a094a32647
begin
	datastack =DataFrames.stack(df, 2:11, :religion)
	rename!(datastack,"variable" => "income", "value" => "freq")
	arr= groupby(datastack, :religion)
	vcat(arr[1],arr[2],arr[3],arr[4],arr[5],arr[6],arr[7],arr[8],arr[9],arr[10])
end

# ╔═╡ 0586b3c0-7f2a-11eb-0117-252620a7fb2e
md"# Problem 2"

# ╔═╡ 1358e900-7f2a-11eb-3d3e-db8e707f29fb
begin
	df22 = DataFrame(
	id = ["MX17004" for i in 1:10],
	year = [2011 for i in 1:10],
	month= [1,1,2,2,3,3,4,4,5,5],
	element = ["tmax","tmin","tmax","tmin","tmax","tmin","tmax","tmin","tmax","tmin"],
	d1=[30.5,28.9,56.7,31.0,30,missing,44.1,15.8,missing,10.1],
	d2=[24.5,14.9,36.7,21.0,10,5,24.1,15.8,missing,9.1],
	d3=[38.9,17.11,56.81,38.9,34.6,25.6,98,78.4,67.5,55],
	d4=[28.9,27.11,26.81,18.9,14.6,5.6,78,38.4,57.5,35],
	d5=[missing,11.9,missing,55.11,45,35,67.8,34.0,67.4,45.9],
	d6=[missing,10.9,missing,54.11,35,25,57.8,24.9,64.4,41.9],
	d7=[missing,56.7,89.11,60.7,56.9,22.22,87,56.01,34.6,27.8],
	d8=[11.7,1.7,59.11,40.7,53.9,12.22,57,36.01,24.6,missing],
	d9=[missing,45.6,78.8,12.8,missing,78.9,45.7,28.9,36.7,27.1],
	d10=[missing,34.6,38.8,11.8,missing,76.9,35.7,18.9,36.7,27.1],
	d11=[31,14,missing,missing,missing,missing,missing,missing,missing,missing],
	d12=[missing,missing,missing,missing,missing,missing,missing,missing,missing,missing],
		d13=[45.7,27.8,45.9,34,67,39,34,28,56,45],
		d14=[35.7,27.8,35.9,31,47,39,24,21,53,48],
		d15=[missing,missing,missing,missing,missing,missing,missing,missing,missing,23],
		
		d16=[missing,missing,missing,missing,missing,missing,missing,missing,missing,missing],
		d17=[23,18,67,30,91,46,87,42,67,29],
		d18=[13,12,37,40,21,16,17,12,47,39],
		d19=[67.8,58.7,98.9,23,67,47,45,missing,56.8,38],
		d20=[5.8,3.7,38.9,13,63,27,35,missing,26.8,23],
		
		d21=[missing,missing,missing,missing,missing,missing,missing,missing,23,12],
	d22=[31,14,missing,missing,missing,missing,missing,missing,missing,missing],
			d23=[78,49,90,23,89.5,missing,missing,67.8,56.7,10],
			d24=[38,29,67,13,83.5,missing,missing,37.8,46.7,9],
			d25=[45.6,28.9,99,54,67.8,20.5,23.5,missing,9.99,5.6],
			d26=[35.6,28.9,39,24,37.8,1.5,13.5,missing,8.99,4.6],
			d27=[missing,missing,missing,missing,missing,missing,missing,missing,missing,8],
	d28=[missing,missing,missing,missing,missing,missing,missing,missing,missing,6],
	d29=[56,missing,missing,missing,45,23,67,56,78,34],
		d30=[78,missing,missing,missing,56,34,missing,missing,45,23]
)
end

# ╔═╡ da5522f0-7f3c-11eb-0923-7faeee958953
a=DataFrames.stack(df22,5:34,variable_name= :date)

# ╔═╡ bfa7dbee-7f37-11eb-2579-bd00c9731db6
df222=dropmissing!(unstack(a, :element, :value))

# ╔═╡ eb78bf60-7f37-11eb-1613-d57d1dbac74a
select(df222, :id, [:year, :month, :date] => ByRow((y,m,d) -> Dates.Date(y, m, parse(Int32, d[2:lastindex(d)]))) => :date, Not([:id, :year, :month, :date]))

# ╔═╡ 4ce5af42-7e95-11eb-0f74-b76415779886
md"# Problem 3"

# ╔═╡ 4c818450-7e97-11eb-2428-3d37cdfb476c
begin
	
	df1 = DataFrame(
		year= [2000 for _ in 1:7],
		artist = ["2 Pac" for _ in 1:7],
		time = ["4:22" for _ in 1:7],
		track = ["Baby Don't Cry" for _ in 1:7],
		date = [Date(2000,2,26), Date(2000,3,4), Date(2000,3,11), Date(2000,3,18), Date(2000,3,25), Date(2000,4,1), Date(2000,4,8)],
		week = 1:7,
		rank=[87, 82, 72, 77, 87, 94, 99]
	)
	df2=DataFrame(
		year=[2000 for _ in 1:3],
		artist = ["2Ge+her" for _ in 1:3],
		time = ["3:15" for _ in 1:3],
		track = ["The Hardest Part Of..." for _ in 1:3],
		date = [Date(2000,9,2), Date(2000,9,9), Date(2000,9,16)],
		week =1:3,
		rank = [91,87,92]
		)
	df3=DataFrame(
		year=[2000 for _ in 1:5],
		artist = ["3 Doors Down" for _ in 1:5],
		time = ["3:53" for _ in 1:5],
		track = ["Kryptonite" for _ in 1:5],
		date = [Date(2000,4,8), Date(2000,4,15), Date(2000,4,22), Date(2000,4,29), Date(2000,5,6)],
		week =1:5,
		rank = [81, 70, 68, 67, 66]
		)
	vcat(df1,df2,df3) 
end

# ╔═╡ 1b289ae0-7ead-11eb-27db-8bcfc954ff67
begin
    df0 = unique(select(vcat(df1,df2,df3), [:artist, :track, :time]))
	insertcols!(df0, 1, :id => 1:3, makeunique=true)
	df0
end

# ╔═╡ 267652b0-7eae-11eb-3458-4ba8417e3046
select(innerjoin(vcat(df1,df2,df3),df0,on=[:artist,:track,:time]),:id,:date,:rank)

# ╔═╡ 4896ddd2-7eb1-11eb-2e83-650f7f3e4b93
md"# Problem 4"

# ╔═╡ 2eba92b0-7ebd-11eb-0548-591b3a833f51
begin
	df4.dateymd = Date.(df4.dateymd)
	date=df4.dateymd
	dF=DateFormat("y-m-d")
	temp=df4[:,:dateymd]
	con=tryparse.(Int, df4.dailyconfirmed)
	rec=tryparse.(Int,df4.dailyrecovered)
	dec=tryparse.(Int, df4.dailydeceased)
	year=passmissing(Dates.year).(date)
	month=passmissing(Dates.month).(date)
	df4.dailyconfirmed = con
	df4.dailydeceased = dec
	df4.dailyrecovered = rec
	df4[!,"month"] = month
	df4[!,"year"] = year
	df4
end

# ╔═╡ 0eddb600-7eba-11eb-0456-1b4c1bd7fc15
combine(groupby(df4,[:year,:month]),:dailyconfirmed=>sum,:dailydeceased=>sum,:dailyrecovered=>sum)

# ╔═╡ 5dc61830-7f40-11eb-2354-45a142f69fe4
md"# Problem 5"

# ╔═╡ 81ed7532-7f56-11eb-3ef6-11d9600cdf72
begin
	conf=0
	dece=0
	re=0
	deceavg=[]
	confavg=[]
	recavg=[]
end

# ╔═╡ e36a94a2-7f56-11eb-3b63-7f5efab1f287
begin
	for i in 1:7
		conf= conf + df4[:,:dailyconfirmed][i]
	end
	push!(confavg,conf/7)
	for i in 8:402
		conf = conf + df4[:,:dailyconfirmed][i]-df4[:,:dailyconfirmed][i-7]
		push!(confavg,conf/7)
	end
	
end
	

# ╔═╡ 0bed858e-7f57-11eb-1a7b-5d768418d47c
begin
	for i in 1:7
		dece= dece+df4[:,:dailydeceased][i]
	end
	push!(deceavg,dece/7)
	for i in 8:402
		dece = dece + df4[:,:dailydeceased][i]-df4[:,:dailydeceased][i-7]
	
		push!(deceavg,dece/7)
	end
end


# ╔═╡ 1addfc10-7f57-11eb-0628-156596f75557
begin
	for i in 1:7
		re=re+df4[:,:dailyrecovered][i]
	end
	push!(recavg,re/7)
	for i in 8:402
		re = re + df4[:,:dailyrecovered][i]-df4[:,:dailyrecovered][i-7]
		push!(recavg,re/7)
	end
end


# ╔═╡ 766340b0-7f41-11eb-074d-85f631e612fa
begin
	x=plot(df4[7:402,:dateymd],confavg,xlabel="dates",ylabel="dailyconfirmed_mavg",legend=false)
	plot(plot(df4[:,:dateymd],df4[:,:dailyconfirmed],xlabel="dates",ylabel="dailyconfirmed",legend=false,colour=[:red]),x)
end

# ╔═╡ 54eac650-7f47-11eb-13ec-db2925de9c03
begin
	y=plot(df4[7:402,:dateymd],deceavg,xlabel="Date(YYYY-MM-DD)",ylabel=" dailydeceased_mavg ",legend=false)
	plot(plot(df4[:,:dateymd],df4[:,:dailydeceased],xlabel="dates",ylabel="dailydeceased",legend=false, colour=[:blue]),y)
end

# ╔═╡ 6fae6dc0-7f47-11eb-0120-8715f4f347b4
begin
	z=plot(df4[7:402,:dateymd],recavg,xlabel="dates",ylabel="dailyrecovered_mavg",legend=false)
	plot(plot(df4[:,:dateymd],df4[:,:dailyrecovered],xlabel="dates",ylabel="dailyrecovered",legend=false, colour=[:green]),z)
end

# ╔═╡ Cell order:
# ╟─25901ac0-7e95-11eb-0087-07cb1d3ba51d
# ╠═d2ed0d00-7e7b-11eb-2018-f37d5a0bd2cd
# ╠═f7ef7a00-7e8c-11eb-284d-a1b4b1ec4a6d
# ╠═d2b42d40-7e7c-11eb-004e-8b18c5dbcfd4
# ╠═59a90300-7e89-11eb-189e-47f8753a1096
# ╠═dc9a52e0-7e8a-11eb-333a-f7a094a32647
# ╠═0586b3c0-7f2a-11eb-0117-252620a7fb2e
# ╠═0669a66e-7f3a-11eb-087c-6310b21a0f63
# ╠═1358e900-7f2a-11eb-3d3e-db8e707f29fb
# ╠═da5522f0-7f3c-11eb-0923-7faeee958953
# ╠═bfa7dbee-7f37-11eb-2579-bd00c9731db6
# ╠═eb78bf60-7f37-11eb-1613-d57d1dbac74a
# ╟─4ce5af42-7e95-11eb-0f74-b76415779886
# ╠═4c818450-7e97-11eb-2428-3d37cdfb476c
# ╠═1b289ae0-7ead-11eb-27db-8bcfc954ff67
# ╠═267652b0-7eae-11eb-3458-4ba8417e3046
# ╟─4896ddd2-7eb1-11eb-2e83-650f7f3e4b93
# ╠═4fe60d3e-7eb1-11eb-04cf-738128d2fd60
# ╠═2eba92b0-7ebd-11eb-0548-591b3a833f51
# ╠═0eddb600-7eba-11eb-0456-1b4c1bd7fc15
# ╟─5dc61830-7f40-11eb-2354-45a142f69fe4
# ╠═9ea24040-7f40-11eb-3145-d95948167bbc
# ╠═81ed7532-7f56-11eb-3ef6-11d9600cdf72
# ╠═e36a94a2-7f56-11eb-3b63-7f5efab1f287
# ╠═0bed858e-7f57-11eb-1a7b-5d768418d47c
# ╠═1addfc10-7f57-11eb-0628-156596f75557
# ╠═766340b0-7f41-11eb-074d-85f631e612fa
# ╠═54eac650-7f47-11eb-13ec-db2925de9c03
# ╠═6fae6dc0-7f47-11eb-0120-8715f4f347b4
