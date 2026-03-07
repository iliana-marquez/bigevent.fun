<?php

namespace App\Form;

use App\Entity\Events;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class EventsType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name', null, [
                "attr" => [
                    "placeholder"=>"Name of the Event", 
                    "class"=>"input-box"
                    ]])
        
            ->add('date_time', null, [
                'widget' => 'single_text',
                'label' => 'Date & Time ',
                "attr" => [
                    "class"=>"input-box",
                    ]])

            ->add('description',null, [
                "attr" => [
                    "placeholder"=>"What is the event about?", 
                    "class"=>"input-box"
                    ]])

            ->add('image',null, [
                "attr" => [
                    "placeholder"=>"Enter the image link", 
                    "class"=>"input-box"
                    ]])

            ->add('capacity',null, [
                'label' => 'Max Capacity',
                "attr" => [
                    "placeholder"=>"Name of the Event", 
                    "class"=>"input-box"
                    ]])
            ->add('contact_email', EmailType::class, [
                'label' => 'Email to contact the event',
                "attr" => [
                    "placeholder"=>"Enter the contact email", 
                    "class"=>"input-box"
                    ]])
            ->add('contact_phone',null, [
                'label' => 'Phone No. to contact the event',
                "attr" => [
                    "placeholder"=>"Enter the contact phone number", 
                    "class"=>"input-box"
                    ]])
            ->add('street_name',null, [
                'label' => 'Address / Street Name',
                "attr" => [
                    "placeholder"=>"Enter the street name", 
                    "class"=>"input-box"
                    ]])
            ->add('street_number',null, [
                'label' => 'Address / Street Number',
                "attr" => [
                    "placeholder"=>"Enter the street number", 
                    "class"=>"input-box"
                    ]])
            ->add('zipcode',null, [
                'label' => 'Address / Zipcode',
                "attr" => [
                    "placeholder"=>"Enter the Zipcode", 
                    "class"=>"input-box"
                    ]])
            ->add('city',null, [
                "attr" => [
                    "placeholder"=>"Enter the City of the Event", 
                    "class"=>"input-box"
                    ]])
            ->add('country',null, [
                "attr" => [
                    "placeholder"=>"Enter the Country of the Event", 
                    "class"=>"input-box"
                    ]])
            ->add('link',null, [
                "attr" => [
                    "placeholder"=>"Enter the Link to the Event", 
                    "class"=>"input-box"
                    ]])
            ->add('category',ChoiceType::class, [
                'label' => 'Select the Events Category',
                'choices'  => [
                    'Concert' => 'Concert',
                    'Festival' => 'Festival',
                    'Party' => 'Party',
                    'Performing Arts' => 'Performing Arts',
                    'Food & Drink' => 'Food and Drink',
                ], 
                "attr" => [
                    "class"=>"input-box"
                ]])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Events::class,
        ]);
    }
}
