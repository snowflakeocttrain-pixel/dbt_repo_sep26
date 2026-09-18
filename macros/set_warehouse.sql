{%macro set_wh(model_size) %}

{% if model_size == 'large' %}
use warehouse DEMO_WH;
{% else %}
use WAREHOUSE COMPUTE_WH;
{% endif %}

{% endmacro %}