### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ b51d10e0-708e-11eb-0c15-29225f69214a
begin
	using Plots
	pyplot()
	using Random
end

# ╔═╡ b9195c70-735a-11eb-37c7-457491faea41
md"# Problem2"

# ╔═╡ 318c8160-6fa9-11eb-1f82-7171cfb24b14
arr=[]

# ╔═╡ 5dad3280-6fa9-11eb-2dd6-e95a65ded5e7
begin
	for i in 1:4
		push!(arr,'T')	
	end
	for i in 1:48
		push!(arr,'F')
	end
end

# ╔═╡ 6a0f8a70-6fb1-11eb-124f-cf751fe16f92
arr

# ╔═╡ a6fdbdb0-735a-11eb-3db7-2558dfd07b4d
md"# (a) Without Replacement"

# ╔═╡ dc0a2900-6fb1-11eb-2c4a-6d054b783e30
begin
	count0=0
	count1=0
	count2=0
	count3=0
	count4=0
	prob1=[]
	
	for i in 1:10^5
				arr1=copy(arr)
				choose1=rand(arr1)
				deleteat!(arr1, findfirst(x-> x == 'T', arr1))
				choose2=rand(arr1)
				deleteat!(arr1, findfirst(x-> x == 'T', arr1))
				choose3=rand(arr1)
				deleteat!(arr1, findfirst(x-> x == 'T', arr1))
				choose4=rand(arr1)
				deleteat!(arr1, findfirst(x-> x == 'T', arr1))
				choose5=rand(arr1)
				if(choose1=='T' && choose2=='T' && choose3=='T' && choose4=='T' && choose5=='F')
					count0+=1
				end
			end
		
	
	for i in 1:10^5
				arr2=copy(arr)
				choose6=rand(arr2)
				deleteat!(arr2, findfirst(x-> x == 'T', arr2))
				choose7=rand(arr2)
				deleteat!(arr2, findfirst(x-> x == 'T', arr2))
				choose8=rand(arr2)
				deleteat!(arr2, findfirst(x-> x == 'T', arr2))
				choose9=rand(arr2)
				deleteat!(arr2, findfirst(x-> x == 'F', arr2))
				choose10=rand(arr2)
				if(choose6=='T' && choose7=='T' && choose8=='T' && choose9=='F' && choose10=='F')
					count1+=1
				end
			end
			
	
	for i in 1:10^5
				arr3=copy(arr)
				choose11=rand(arr3)
				deleteat!(arr3, findfirst(x-> x == 'T', arr3))
				choose12=rand(arr3)
				deleteat!(arr3, findfirst(x-> x == 'T', arr3))
				choose13=rand(arr3)
				deleteat!(arr3, findfirst(x-> x == 'F', arr3))
				choose14=rand(arr3)
				deleteat!(arr3, findfirst(x-> x == 'F', arr3))
				choose15=rand(arr3)
				if(choose11=='T' && choose12=='T' && choose13=='F' && choose14=='F' && choose15=='F')
					count2+=1
				end
			end
			
	
	for i in 1:10^5
				arr4=copy(arr)
				choose16=rand(arr4)
				deleteat!(arr4, findfirst(x-> x == 'T', arr4))
				choose17=rand(arr4)
				deleteat!(arr4, findfirst(x-> x == 'F', arr4))
				choose18=rand(arr4)
				deleteat!(arr4, findfirst(x-> x == 'F', arr4))
				choose19=rand(arr4)
				deleteat!(arr4, findfirst(x-> x == 'F', arr4))
				choose20=rand(arr4)
				if(choose16=='T' && choose17=='F' && choose18=='F' && choose19=='F' && choose20=='F')
					count3+=1
				end
		end
		
	
	for i in 1:10^5
		arr5=copy(arr)
		choose21=rand(arr5)
		deleteat!(arr5, findfirst(x-> x == 'F', arr5))
		choose22=rand(arr5)
		deleteat!(arr5, findfirst(x-> x == 'F', arr5))
		choose23=rand(arr5)
		deleteat!(arr5, findfirst(x-> x == 'F', arr5))
		choose24=rand(arr5)
		deleteat!(arr5, findfirst(x-> x == 'F', arr5))
		choose25=rand(arr5)
		if(choose21=='F' && choose22=='F' && choose23=='F' && choose24=='F' && choose25=='F')
			count4+=1
		end
	end
	push!(prob1,count4/10^5)
	push!(prob1,5*count3/10^5)
	push!(prob1,5*2*count2/10^5)
	push!(prob1,5*2*count1/10^5)
	push!(prob1,5*count0/10^5)
	
plot(0:4,prob1,xlabel="Number of jacks drawn",ylabel="Probability",legend=false)

end

# ╔═╡ 5d9c7840-739c-11eb-2d1e-fb80c00d576a
(prob1)

# ╔═╡ 9fea37b0-735a-11eb-3774-650046de3eb8
md"# (b) With Replacement"

# ╔═╡ c2288a60-7365-11eb-050e-714405fc4540
begin
	count5=0
	count6=0
	count7=0
	count8=0
	count9=0
	count10=0
	prob=[]
	
	for i in 1:10^5
		var=0
		for j in 1:5
			pick=rand(arr)
			if(pick=='T')
				var=var+1
			end
		end
		if(var==0)
			count5=count5+1
		end
		if(var==1)
			count6=count6+1
		end
		if(var==2)
			count7=count7+1
		end
		if(var==3)
			count8=count8+1
		end
		if(var==4)
			count9=count9+1
		end
		if(var==5)
			count10=count10+1
		end
	end
	
	push!(prob,count5/10^5)
	push!(prob,count6/10^5)
	push!(prob,count7/10^5)
	push!(prob,count8/10^5)
	push!(prob,count9/10^5)
	push!(prob,count10/10^5)
	
	plot(0:5,prob,xlabel="Number of jacks drawn",ylabel="Probability",legend=false)
end

# ╔═╡ 70bc67a0-739c-11eb-28bf-5deaef807625
prob

# ╔═╡ Cell order:
# ╠═b9195c70-735a-11eb-37c7-457491faea41
# ╠═318c8160-6fa9-11eb-1f82-7171cfb24b14
# ╠═5dad3280-6fa9-11eb-2dd6-e95a65ded5e7
# ╠═6a0f8a70-6fb1-11eb-124f-cf751fe16f92
# ╠═b51d10e0-708e-11eb-0c15-29225f69214a
# ╠═a6fdbdb0-735a-11eb-3db7-2558dfd07b4d
# ╠═dc0a2900-6fb1-11eb-2c4a-6d054b783e30
# ╠═5d9c7840-739c-11eb-2d1e-fb80c00d576a
# ╠═9fea37b0-735a-11eb-3774-650046de3eb8
# ╠═c2288a60-7365-11eb-050e-714405fc4540
# ╠═70bc67a0-739c-11eb-28bf-5deaef807625
