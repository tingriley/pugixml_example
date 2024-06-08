#include<iostream>
#include<fstream>
#include "pugixml.hpp"
using namespace std;

void load_doc_from_file()
{
    pugi::xml_document doc;
    pugi::xml_parse_result result = doc.load_file("tree.xml");
    //cout << "Load result: " << result.description() << endl;
    cout << ", mesh name: " << doc.child("mesh").attribute("name").value() << endl;
}

void load_doc_from_memory()
{
    ifstream t("tree.xml");  
    string str((std::istreambuf_iterator<char>(t)), 
                std::istreambuf_iterator<char>()); 
    
    pugi::xml_document doc;
    pugi::xml_parse_result result = doc.load_string(str.c_str());
	cout << ", mesh name: " << doc.child("mesh").attribute("name").value() << endl;
	
}

int main()
{
    load_doc_from_file();
    load_doc_from_memory();
    return 0;
}