class ProvinceController < ApplicationController

    def province_params
        params_require(:province).permit(:name, :shortname, :GST, :PST, :HST)
    end
end
