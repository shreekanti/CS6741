### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ d7671820-7422-11eb-1562-e7c9003ef326
begin
	using Plots
		pyplot()
		using Random
	bag = Array[[1 1 1 1 1 1 1 1 1 0], [1 1 1 1 1 1 1 1 0 0], [1 1 1 1 1 1 1 0 0 0], [1 1 1 1 1 1 0 0 0 0], [1 1 1 1 1 0 0 0 0 0 ], [1 1 1 1 0 0 0 0 0 0], [1 1 1 0 0 0 0 0 0 0], [1 1 0 0 0 0 0 0 0 0], [1 0 0 0 0 0 0 0 0 0], [0 0 0 0 0 0 0 0 0 0]]
	p=[0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0]
	ans=[]
end

# ╔═╡ 3d3bf8ee-7423-11eb-1b3f-c395c4039341
md"# Problem 7"

# ╔═╡ 4012bf9e-7423-11eb-3961-f11f82d7dc05
begin
	for k in 1:10
		count = 0
		for i in 1:10^6
			rupee = 10
			flag = 0
			for j in 1:20
				a = rand(bag[k])
				if a == 1
					rupee =rupee+ 1
					
				elseif a == 0
					rupee -= 1
					if rupee == 0
						if flag == 0
							flag = 1
							break
						end
					end
				end
			end
			if flag == 1
				count += 1
			end
		
		end
		push!(ans, count/10^6)
	end
	
end

# ╔═╡ 82c782d0-7424-11eb-04b0-694863529cf7
for i in 1:10
		println("p=",p[i],"  " ,"Respective probability=",ans[i])
end

# ╔═╡ 91c518b0-7424-11eb-2087-b5c7512081e9
begin
	scatter(p, ans, label = "point")
	plot!(p, ans, xlabel = "values of p", ylabel = "Respective Probability", label = "line")
end

# ╔═╡ Cell order:
# ╠═3d3bf8ee-7423-11eb-1b3f-c395c4039341
# ╠═d7671820-7422-11eb-1562-e7c9003ef326
# ╠═4012bf9e-7423-11eb-3961-f11f82d7dc05
# ╠═82c782d0-7424-11eb-04b0-694863529cf7
# ╠═91c518b0-7424-11eb-2087-b5c7512081e9
