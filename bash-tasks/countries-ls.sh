#Bash script to output a two-column list sorted alphabetically by capital city"
#!/bin/bash

# Data set of countries and capitals (same data as before)
data="Afghanistan Kabul
Albania Tirana
Algeria Algiers
Andorra Andorra la Vella
Angola Luanda
Antigua and Barbuda St. John's
Argentina Buenos Aires
Armenia Yerevan
Australia Canberra
Austria Vienna
Azerbaijan Baku
Bahamas Nassau
Bahrain Manama
Bangladesh Dhaka
Barbados Bridgetown
Belarus Minsk
Belgium Brussels
Belize Belmopan
Benin Porto-Novo
Bhutan Thimphu
Bolivia Sucre
Bosnia and Herzegovina Sarajevo
Botswana Gaborone
Brazil Brasília
Brunei Bandar Seri Begawan
Bulgaria Sofia
Burkina Faso Ouagadougou
Burundi Bujumbura
Cambodia Phnom Penh
Cameroon Yaoundé
Canada Ottawa
Cape Verde Praia
Central African Republic Bangui
Chad N'Djamena
Chile Santiago
China Beijing
Colombia Bogotá
Comoros Moroni
Congo Brazzaville
Costa Rica San José
Croatia Zagreb
Cuba Havana
Cyprus Nicosia
Czech Republic Prague
Denmark Copenhagen
Djibouti Djibouti
Dominica Roseau
Dominican Republic Santo Domingo
East Timor Dili
Ecuador Quito
Egypt Cairo
El Salvador San Salvador
Equatorial Guinea Malabo
Eritrea Asmara
Estonia Tallinn
Eswatini Mbabane
Ethiopia Addis Ababa"

# Use awk to sort the data by capital city
echo "$data" | awk 'BEGIN { print "Country\tCapital" }
{
    country = $1
    capital = $2
    ddata_array[capital] = country
}
END {
    n = asort(data_array, sorted_array)
    for (i = 1; i <= n; i++) {
        capital = sorted_array[i]
        country = data_array[capital]
        print country "\t" capital
    }
}'
